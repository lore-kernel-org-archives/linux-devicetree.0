From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: Convert Allwinner A23 analog
 codec to a schema
Date: Tue, 17 Sep 2019 14:02:14 -0500
Message-ID: <20190917190214.GA8947@bogus>
References: <20190906151221.3148-1-mripard@kernel.org>
 <20190906151221.3148-2-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190906151221.3148-2-mripard@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri,  6 Sep 2019 18:12:21 +0300, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner A23 SoC and later have an embedded audio codec that uses a
> separate controller to drive its analog part, which is supported in Linux,
> with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> ---
> 
> Changes from v2:
>   - Use an enum instead of a oneOf for the compatibles
> 
> Changes from v1:
>   - Fix subject prefix
> ---
>  .../allwinner,sun8i-a23-codec-analog.yaml     | 38 +++++++++++++++++++
>  .../bindings/sound/sun8i-codec-analog.txt     | 17 ---------
>  2 files changed, 38 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
