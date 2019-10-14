From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 2/3] dt-bindings: ASoC: WSA881x: Add
 missing #sound-dai-cells
Date: Mon, 14 Oct 2019 09:30:41 -0500
Message-ID: <20191014143041.GA5564@bogus>
References: <20191011152446.5925-1-srinivas.kandagatla@linaro.org>
 <20191011152446.5925-3-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20191011152446.5925-3-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org, devicetree@vger.kernel.org, spapothi@codeaurora.org, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org, broonie@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Oct 2019 16:24:45 +0100, Srinivas Kandagatla wrote:
> As this codec now exposes dai, add missing #sound-dai-cells.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
