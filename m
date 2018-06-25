From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH 11/11] ASoC: qdsp6: q6routing: add proper
	error check
Date: Mon, 25 Jun 2018 20:04:54 +0200
Message-ID: <20180625180454.GI10876@centauri.lan>
References: <20180625143115.8346-1-srinivas.kandagatla@linaro.org>
 <20180625143115.8346-12-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20180625143115.8346-12-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: rohkumar@qti.qualcomm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2018 at 03:31:15PM +0100, Srinivas Kandagatla wrote:
> q6adm_open can return error pointer or a null in error cases.
> Fix this check this.

Instead of "Fix this check this.", how about "Fix the return handling."

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6routing.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index caf2f847a886..c18f808c7730 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -310,7 +310,7 @@ int q6routing_stream_open(int fedai_id, int perf_mode,
>  			      session->channels, topology, perf_mode,
>  			      session->bits_per_sample, 0, 0);
>  
> -	if (!copp) {
> +	if (IS_ERR_OR_NULL(copp)) {
>  		mutex_unlock(&routing_data->lock);
>  		return -EINVAL;
>  	}
> -- 
> 2.16.2
> 
