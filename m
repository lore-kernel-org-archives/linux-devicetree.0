From: Tony Camuso <tcamuso@redhat.com>
Subject: Re: [PATCH] ipmi: add new kernel options to
 prevent automatic ipmi init
Date: Fri, 14 Dec 2012 09:23:30 -0500
Message-ID: <50CB3662.5080100@redhat.com>
References: <1355424008-20491-1-git-send-email-tcamuso@redhat.com>
	<50CA31BB.2030507@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <50CA31BB.2030507@acm.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: minyard@acm.org
Cc: Robert Evans <Robert.Evans@stratus.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, Jim Paradis <jparadis@redhat.com>, openipmi-developer@lists.sourceforge.net, Corey Minyard <tcminyard@gmail.com>
List-Id: devicetree@vger.kernel.org

RHEL builds the ipmi_si into the kernel by default, rather than as a
module, because it is required early in order to be available for ACPI
opregion access. However, it appears that some of our customers have
custom ipmi drivers, and this gets in their way.

Stratus is currently evaluating your suggestions, and we are expecting a
response from them sometime today or early next week.

On 12/13/2012 02:51 PM, Corey Minyard wrote:
> Well, the built-in driver works on systems that have more than one interface
> and more than one BMC, and multiple IPMBs (and all of the other channel
> types for that matter, and the driver handles all the multiplexing and nasty
> addressing).  There is, in fact, no arbitrary limit, and IBM tested
> this fairly extensively with some of their systems.  I'm not sure why you
> would need a custom driver, and if there are some custom things that need
> to be done for your servers, I'd be happy to add that.  I've worked with a
> number of other vendors to get changes like this in.  And then ipmitool,
> freeipmi, openipmi, etc. will work with the device.
>
> I don't have a big problem with this patch.  I wonder why you would want
> to compile the standard driver into your kernel if you expected to load a
> module with a custom driver later, though.  None of the distros I know of
> compile it in, it's always a module.
>
> You can also dynamically remove the device from the driver using the hot
> add/remove capability.  To remove it, you can do:
>    echo remove,`cat /proc/ipmi/0/params`
> and it will disassociate that device (IPMI interface 0 in this case) from the
> driver.  So you can iterate through all the devices in /proc/ipmi and
> remove them all at startup.
>
> If none of the above options work for you, we can go ahead with this
> patch.  Just wanted to let you know that current options exist, and see
> if you wanted to take a different direction.
>
> -corey
>

------------------------------------------------------------------------------
LogMeIn Rescue: Anywhere, Anytime Remote support for IT. Free Trial
Remotely access PCs and mobile devices and provide instant support
Improve your efficiency, and focus on delivering more value-add services
Discover what IT Professionals Know. Rescue delivers
http://p.sf.net/sfu/logmein_12329d2d
