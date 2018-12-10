From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] regulator: dt-bindings: add MCP16502 regulator
  bindings
Date: Mon, 10 Dec 2018 16:28:45 -0600
Message-ID: <20181210222845.GA9114@bogus>
References: <1543917126-32572-1-git-send-email-andrei.stefanescu@microchip.com>
 <1543917126-32572-2-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543917126-32572-2-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

On Tue, 4 Dec 2018 09:52:28 +0000, <Andrei.Stefanescu@microchip.com> wrote:
> This patch describes the compatible and the device tree
> bindings necessary for the MCP16502 PMIC.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
> ---
>  .../bindings/regulator/mcp16502-regulator.txt      | 143 +++++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mcp16502-regulator.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
