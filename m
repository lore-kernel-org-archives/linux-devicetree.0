From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Mon, 16 Mar 2015 15:46:51 -0400
Message-ID: <5507332B.5020504@hurleysoftware.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com> <5507227D.8020408@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <5507227D.8020408@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/16/2015 02:35 PM, Hans de Goede wrote:
> To be clear about my aarch64 remark, that relates to the behavior of aarch64 acpi using
> machines, those will also output to both a serial tty and tty0 when the acpi equivalent
> of stdout-path is present and points to a serial tty.

I already made comments addressing the unsuitability of the license for the
aarch64 acpi console; the proposed SPCR table format is patented by Microsoft and
licensed incompatibly with GPLv2.

That said, the aarch64 acpi console should be treated like any other prom that
starts a console and so won't suffer from this breakage.

Regards,
Peter Hurley
