From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 09/13] ARM: sun9i: smp: Rename clusters's power-off
Date: Tue, 3 Apr 2018 17:06:17 +0800
Message-ID: <CAGb2v67n8DzqOJWAaWGpdb2-AS0UM+_+qFZCt4_Dzb4+ySTcRQ@mail.gmail.com>
References: <20180403061836.3926-1-mylene.josserand@bootlin.com> <20180403061836.3926-10-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403061836.3926-10-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, quentin.schulz@bootlin.com, linux-kernel <linux-kernel@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 3, 2018 at 2:18 PM, Mylène Josserand
<mylene.josserand@bootlin.com> wrote:
> To prepare the support for sun8i-a83t, rename the variable name
> that handles the power-off of clusters because it is different from
> sun9i-a80 to sun8i-a83t.
>
> The power off register for clusters are different from a80 and a83t.
>
> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
