From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 4/6] dt-bindings: anybus-controller: document
 devicetree binding
Date: Fri, 7 Dec 2018 11:44:45 -0600
Message-ID: <20181207174445.GA13582@bogus>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-5-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181204220224.27324-5-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: svendev@arcx.com, linus.walleij@linaro.org, lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 04, 2018 at 05:02:22PM -0500, Sven Van Asbroeck wrote:
> From: Sven Van Asbroeck <svendev@arcx.com>
> 
> This patch adds devicetree binding documentation for the
> Arcx anybus controller.
> 
> Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
> ---
>  .../fieldbus/arcx,anybus-controller.txt       | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt

This looks fine to me now, but still seems the rest of the series has 
some discussion. In theory, all that should have no impact on the 
bindings.

Rob
