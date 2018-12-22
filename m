From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add amediatech x96-max
 bindings
Date: Sat, 22 Dec 2018 17:40:11 +0100
Message-ID: <CAFBinCBUm+Js1-ZabP9bSmYE0qG9Z9gYr-ua+ayDyPOdXUsEyQ@mail.gmail.com>
References: <20181219233519.35287-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181219233519.35287-1-khilman@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Thu, Dec 20, 2018 at 12:35 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Add new vendor for amediatech, and initial board: x96-max
as we have seen there is no "amediatech" branding anywhere on the board itself
however, FCC gave us a clue about the manufacturer: [0]
can you please add this info to the patch description when re-sending?

> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
(with the two comments below)

>  Documentation/devicetree/bindings/arm/amlogic.txt     | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
if Rob is fine with vendor-prefixes.txt being updated together with
adding a new board then I'm as well :)

>  2 files changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
> index 8dbc259081e4..c50b084b6c59 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.txt
> +++ b/Documentation/devicetree/bindings/arm/amlogic.txt
> @@ -99,6 +99,7 @@ Board compatible values (alphabetically, grouped by SoC):
>    - "amlogic,p281" (Meson gxl s905w)
>    - "oranth,tx3-mini" (Meson gxl s905w)
>
> +  - "amediatech,x96-max" (Meson gxm s912)
I assume that you'll not only fix the SoC here (G12A) as reported by
Chris Moore but also the ordering


Regards
Martin


[0] https://fccid.io/2AI6D-X96MAX
