From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v1 1/3] phy: phy-core: allow specifying supply at port level
Date: Wed, 25 Mar 2015 15:17:17 -0700
Message-ID: <CAE_wzQ_8YzZwizyozU-0MPLX8-hT1Y1LnfYFg+iEvQgYX7zjFg@mail.gmail.com>
References: <1426886727-537-1-git-send-email-arun.ramamurthy@broadcom.com>
	<1426886727-537-2-git-send-email-arun.ramamurthy@broadcom.com>
	<55133294.4040705@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55133294.4040705@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Arun Ramamurthy <arun.ramamurthy@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anatol Pomazau <anatol@google.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Dmitry Torokhov <dtor@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 25, 2015 at 3:11 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> Hi,
>
> On Saturday 21 March 2015 02:55 AM, Arun Ramamurthy wrote:
>> Multi-port phy's may have per-port power supplies. Let's change phy core
>> to first attempt to look up the supply at the port level, and then, if
>> not found, check parent device.
>
> Why not just have every port provide the power supply if it needs?
> I don't think checking for parent device should be present in the phy-core at
> all.

We need to do that if we want to keep compatibility with the current
DTSes: before this patch the supply would be always looked up on
device and not port level.

Thanks,
Dmitry
