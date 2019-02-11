From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: regulator: update fixed-regulator example
Date: Mon, 11 Feb 2019 11:36:34 -0600
Message-ID: <CAL_Jsq+rRYazOqtjNms0cTK0HpkxCkmZ4JXoLM7ZaPivATEO8A@mail.gmail.com>
References: <20190208140425.12917-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208140425.12917-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 8, 2019 at 8:05 AM Johan Hovold <johan@kernel.org> wrote:
>
> Fixed regulators do not have associated bus addresses and are typically
> placed directly under the root node where their names must still be
> unique despite not having a unit address.
>
> Fix the malformed example node which had a unit address but no "reg"
> property by dropping the unit address.
>
> Also, try to make the example more useful by using the recommended
> generic node name "regulator", but with a suffix reflecting the
> regulator name in order to make it unique.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  .../devicetree/bindings/regulator/fixed-regulator.yaml        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
