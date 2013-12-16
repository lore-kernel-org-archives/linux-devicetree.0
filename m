From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv4] rtc: Add support for Intersil ISL12057 I2C RTC chip
Date: Mon, 16 Dec 2013 23:24:01 +0100
Message-ID: <87mwk0l9j2.fsf@natisbad.org>
References: <1dec5992db795b61e91e0abf910dee7fce322ccc.1387227955.git.arno@natisbad.org>
	<20131216213706.GA8527@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131216213706.GA8527@roeck-us.net> (Guenter Roeck's message of
	"Mon, 16 Dec 2013 13:37:06 -0800")
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

Guenter Roeck <linux@roeck-us.net> writes:

> On Mon, Dec 16, 2013 at 10:17:47PM +0100, Arnaud Ebalard wrote:
>> 
>> Intersil ISL12057 I2C RTC chip also supports two alarms. This patch
>> only adds support for basic RTC functionalities (i.e. getting and
>> setting time). Tests have been performed on NETGEAR ReadyNAS 102 w/
>> startup/shutdown scripts, hwclock, ntpdate and openntpd.
>> 
>> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
>
> Here is a snippet from the saved patch:
>
>  obj-$(CONFIG_RTC_DRV_IMXDI)    +=3D rtc-imxdi.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)  +=3D rtc-isl1208.o
>  obj-$(CONFIG_RTC_DRV_ISL12022) +=3D rtc-isl12022.o
> +obj-$(CONFIG_RTC_DRV_ISL12057)  +=3D rtc-isl12057.o
>  obj-$(CONFIG_RTC_DRV_JZ4740)   +=3D rtc-jz4740.o
>  obj-$(CONFIG_RTC_DRV_LP8788)   +=3D rtc-lp8788.o
>  obj-$(CONFIG_RTC_DRV_LPC32XX)  +=3D rtc-lpc32xx.o
>
> Something is adding those '3D' after each '=' into the patch.

Well, I simply use git-imap-send to send the patch to my IMAP draft
folder and then sent it from my mailer (Gnus/5.13 for Emacs/24.3).

What is very weird is that if I simply save the mail I received from
LAKML (I am registered to LAKML which I have put in Cc:), checkptach
gives me the following (my checkpatch.pl is the one in 3.13.0.rc4):

  $ ./scripts/checkpatch.pl /tmp/v4.patch ERROR: Do not include the
  paragraph about writing to the Free Software Foundation's mailing
  address from the sample GPL notice. The FSF has changed addresses in the
  past, and may do so again. Linux already includes a copy of the GPL. 
  #165: FILE: drivers/rtc/rtc-isl12057.c:23:
  + * You should have received a copy of the GNU General Public License$
  
  ERROR: Do not include the paragraph about writing to the Free Software
  Foundation's mailing address from the sample GPL notice. The FSF has
  changed addresses in the past, and may do so again. Linux already
  includes a copy of the GPL. 
  #166: FILE: drivers/rtc/rtc-isl12057.c:24:
  + * along with this program; if not, write to the Free Software$
  
  total: 2 errors, 0 warnings, 396 lines checked
  
  /tmp/v4.patch has style problems, please review.
  
  If any of these errors are false positives, please report
  them to the maintainer, see CHECKPATCH in MAINTAINERS.

Those false/positive are the only error checkptach reports on my side
for the patch. This is the same if I copy/paste the content of the
<pre></pre> with the patch in the following page:

 http://www.spinics.net/lists/arm-kernel/msg294759.html. 

I do not say you are wrong but I do not have a clue were the problem
may come from.


> On a side note, even though it is hard to see, it seems you use two
> spaces instead of a tab above, and that you do the same with other
> defines

That I can confirm.


> (unless the mailer replaced tabs with spaces).
>
> In general, the widely used form for defines is
>
> #define<space>MY_DEFINE<tab>definition<tab>/* this is a comment */

I have changed my .emacs config and will test its behavior.


> Also, I think
>
> +static struct i2c_driver isl12057_driver;
>
> is unnecessary

Right.

Cheers,

a+
