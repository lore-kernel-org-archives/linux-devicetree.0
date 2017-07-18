From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] dt-binding: mfd: Add Maxim/Dallas DS1374 MFD device
 binding
Date: Tue, 18 Jul 2017 10:27:39 +0100
Message-ID: <20170718092739.jjng44v543d4haah@dell>
References: <1499975665-14581-1-git-send-email-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499975665-14581-1-git-send-email-mdf@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <mdf@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, wim@iguana.be, linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 13 Jul 2017, Moritz Fischer wrote:

> This adds a binding for the Maxim/Dallas DS1374 MFD.
> 
> Signed-off-by: Moritz Fischer <mdf@kernel.org>
> ---
> Changes from RFC:
> - dallas,ds1374-mode -> dallas,mode
> - Clarified examples
> - dallas,remap-reset property
> 
> On second thoughts the solution for the remapping found in the
> discussion did not seem to be a good solution, since the INT
> pin indicating watchdog reset does not necessarily have to be
> connected to an interrupt line on the machine, it could equally
> well be hooked up to a PMIC reset input or similar.
> In that case using the presence of an 'interrupt' phandle is not
> a good choice.

For some really odd reason, my mailer is chopping the patch here!

This has never happened before and I'm struggling to find out what's
going on.  Would you be kind enough to fix RobH's comment(s) and
resent please.  Hopefully a resend will fix things.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
