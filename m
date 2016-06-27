From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: RTC support for AMlogic devies
Date: Mon, 27 Jun 2016 20:49:28 +0100
Message-ID: <70b8eaf9-b07c-8a56-8205-58bf6475a3f4@codethink.co.uk>
References: <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
 <m2bn2mtut1.fsf@baylibre.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCEPJZEDQIBBBUMGY25QKGQEDWP3TYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <m2bn2mtut1.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 27/06/16 18:18, Kevin Hilman wrote:
> Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org> writes:
> 
>> This series is support for the RTC block on some of the AMLogic
>> Meson ARM SoCs.
>>
>> The first patch is the driver, followed by device-tree patches
>> and enablement for the ODRoid-C1 (where it has been tested)
> 
> In the cover letter, please be explicit about any dependencies that are
> not upstream.  This series applies to mainline (v4.7-rc*) but does not
> build.  I tested it with my v4.7/integ branch and it seems to work.

I think this is just the DT bindings for the reset controller which
are currently in -next.

> The series also has a handful of checkpatch warnings that should be
> addressed (see: http://hastebin.com/tacurokasu.pas)

The msleep() ones I think are not a big isuse. The line length could
be solved, but at the moment is one of the few issues that are in the
rtc-meson.c driver.

The documentation one is solved by the patch adding the device-tree
binding information.

> Other than that, I gave it a quick spin on meson8b-odroidc1 using
> tools/testing/selftests/timers/rtctest.c, and the basic time stuff seems
> to be working:

Thank you.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
