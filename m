From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/2] AMLogic Meson SoC RTC driver
Date: Tue, 12 Jul 2016 19:23:43 +0200
Message-ID: <20160712172343.GV22202@piout.net>
References: <1468343799-12844-1-git-send-email-ben.dooks@codethink.co.uk>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBIGPSS6AKGQE6XRKOZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1468343799-12844-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Well, I hoped I could send my review before v4 but I was a bit too
late...

On 12/07/2016 at 18:16:37 +0100, Ben Dooks wrote :
> This series adds support for the on SoC RTC driver on the
> AMLogic Meson devices. The device-tree updates are not included
> as they depend on the reset-controller support in -next.
> 
> The series does not have any build dependencies, but does require
> the reset controller and device-tree entries for the device-tree
> files for the relevant boards. 
> 
> The series tested by myself on the ODroid-C1 board with a battery
> pack attached. It has also been tested by Kevin Hilman.
> 
> I will send the DT changes in a second series so that they can be
> merged once the dependencies have been satisified.
> 
> Changes since V3:
>   <1467748122-14833-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> - Added Kevin's tested by
> 
> Changes since V1:
>   <1467039135-26588-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> 
>  - Fixed checkpatch and sparse errors
>  - Fixed minor locking bug when writing static-control register
>  - Updated the code ordering in the rtc-meson.c driver
>  - Fixed alphanumeric ordering in on-cpu rtc block
>  - Added Rob Hering's ack for the DT binding documentation
>  - Added better description to the RTC driver header.
> 
> Ben Dooks (2):
>   rtc: support for amlogic meson rtc
>   meson-rtc: add device-tree binding
> 
>  .../devicetree/bindings/rtc/rtc-amlogic.txt        |  21 ++
>  drivers/rtc/Kconfig                                |   9 +
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-meson.c                            | 349 +++++++++++++++++++++
>  4 files changed, 380 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
>  create mode 100644 drivers/rtc/rtc-meson.c
> 
> -- 
> 2.8.1
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
