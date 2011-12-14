From: "Moffett, Kyle D" <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [REPOST RFC PATCH 0/3] New "gpio-poweroff" driver to turn off
 platform devices with GPIOs
Date: Wed, 14 Dec 2011 14:34:37 -0600
Message-ID: <E30C4693-0D31-4A9A-9E9D-0FC03C5F6B8A@boeing.com>
References: <1323800614-12642-1-git-send-email-Kyle.D.Moffett@boeing.com>
 <4EE7A31E.7080301@gmail.com>
 <895CF182-4BF7-4DF5-A467-944EC008DBC3@boeing.com>
 <20111214120240.GC25088@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111214120240.GC25088-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Dec 14, 2011, at 07:02, Mark Brown wrote:
> On Tue, Dec 13, 2011 at 02:44:48PM -0600, Moffett, Kyle D wrote:
>> I looked at it a bit when I was generalizing my code, but it seemed
>> dramatically more complicated than I needed, and I couldn't see any
>> reasonable way to hook it from the machine_poweroff() code.
> 
> Some ST platform had to do odd stuff with regulators to power off, it
> made a platform device representing the odd poweroff code.

This is actually what I did originally, albeit with GPIOs.

In our case we have a chassis with 6 computers in it, and one of the
computers has 3 GPIOs which are wired to the "off" signal for each domain
(one domain per pair of computers).

Due to isolation requirements, that computer can't turn the domains back
on from software, so really all we need to be able to do is trigger each
GPIO in sequence as part of the poweroff.

So basically the "gpio-poweroff" driver was just a slightly-more-generic
way of doing what I was doing before, by looking up the GPIOs in the
device-tree.


>> There's also the fact that I was looking for a pure-device-tree type
>> of driver and the regulator framework does not seem to support the
>> standard OF-platform probe system.
> 
> The regulator API in -next has DT bindings.

Based on the description of our hardware, is there a good way that I
can wire up gpio-regulator driver to our hardware with just the device
tree (and maybe one small board-specific function) to make it shut down
each domain in sequence at poweroff time? Otherwise I will just go back
to my custom board-specific function for GPIO-twiddling.

Cheers,
Kyle Moffett

--
Curious about my work on the Debian powerpcspe port?
I'm keeping a blog here: http://pureperl.blogspot.com/
