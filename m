From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64-olinuxino: set the PHY TX delay
Date: Thu, 27 Sep 2018 18:51:35 +0800
Message-ID: <CAGb2v67iwJ--dc6V6Vb0fukd4x_2RbCv5wOnHMUYxpZOJvL-YQ@mail.gmail.com>
References: <20180926170545.ogcmt36ff7jmqxkl@flea> <20180926194824.8832-1-rodrigo@tjader.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926194824.8832-1-rodrigo@tjader.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: rodrigo@tjader.xyz
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 3:49 AM Rodrigo Exterckötter Tjäder
<rodrigo@tjader.xyz> wrote:
>
> The PHY found on the A64-OLinuXino requires a TX delay in order to
> operate properly. Olimex uses a 600ps second delay in their BSP, and
> that has been found to work, so let's use that value in the current
> DT.
>
> Signed-off-by: Rodrigo Exterckötter Tjäder <rodrigo@tjader.xyz>

Applied for 4.20. Thanks.
