From: nick <xerofoify@gmail.com>
Subject: Question about fix me comment in the file,
	ipmi_si_intf.c
Date: Thu, 01 Jan 2015 14:27:33 -0500
Message-ID: <54A59FA5.4090703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
	<mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: minyard@acm.org
Cc: grant.likely@linaro.org, devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Greetings Grant,Rob and Corey,
I am wondering about the below code's fix me comment:
enum si_intf_state {
        SI_NORMAL,
        SI_GETTING_FLAGS,
        SI_GETTING_EVENTS,
        SI_CLEARING_FLAGS,
        SI_GETTING_MESSAGES,
        SI_CHECKING_ENABLES,
        SI_SETTING_ENABLES
        /* FIXME - add watchdog stuff. */
};
This fix me seems obsolete to me as the commit was written when Linus created the original git tree for the kernel.
If someone wants me to write a patch removing this comment I would be glad to do so:).
Have a Great Holidays,
Nick 

------------------------------------------------------------------------------
Dive into the World of Parallel Programming! The Go Parallel Website,
sponsored by Intel and developed in partnership with Slashdot Media, is your
hub for all things parallel software development, from weekly thought
leadership blogs to news, videos, case studies, tutorials and more. Take a
look and join the conversation now. http://goparallel.sourceforge.net
