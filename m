From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] pwm: core: Export of_pwm_request() so client
 drivers can also use it
Date: Mon, 10 Dec 2012 23:22:49 +0000
Message-ID: <20121210232249.7356F3E081F@localhost>
References: <1355133637-2784-1-git-send-email-peter.ujfalusi@ti.com>
 <1355133637-2784-4-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355133637-2784-4-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Dec 2012 11:00:36 +0100, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org> wrote:
> Allow client driver to use of_pwm_request() to get the pwm they need. This
> is needed for drivers which handle more than one pwm separately, like
> leds-pwm driver which have:
> 
> pwmleds {
> 	compatible = "pwm-leds";
> 	kpad {
> 		label = "omap4::keypad";
> 		pwms = <&twl_pwm 0 7812500>;
> 		max-brightness = <127>;
> 	};
> 
> 	charging {
> 		label = "omap4:green:chrg";
> 		pwms = <&twl_pwmled 0 7812500>;
> 		max-brightness = <255>;
> 	};
> };
> 
> in the dts files.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
>  drivers/pwm/core.c  | 2 +-
>  include/linux/pwm.h | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 903138b..3a7ebcc 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -486,7 +486,7 @@ static struct pwm_chip *of_node_to_pwmchip(struct device_node *np)
>   * becomes mandatory for devices that look up the PWM device via the con_id
>   * parameter.
>   */
> -static struct pwm_device *of_pwm_request(struct device_node *np,
> +struct pwm_device *of_pwm_request(struct device_node *np,
>  					 const char *con_id)
>  {
>  	struct pwm_device *pwm = NULL;
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index 6d661f3..d70ffe3 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -175,6 +175,7 @@ struct pwm_device *of_pwm_xlate_with_flags(struct pwm_chip *pc,
>  		const struct of_phandle_args *args);
>  
>  struct pwm_device *pwm_get(struct device *dev, const char *consumer);
> +struct pwm_device *of_pwm_request(struct device_node *np, const char *con_id);
>  void pwm_put(struct pwm_device *pwm);
>  
>  struct pwm_device *devm_pwm_get(struct device *dev, const char *consumer);
> @@ -213,6 +214,12 @@ static inline struct pwm_device *pwm_get(struct device *dev,
>  	return ERR_PTR(-ENODEV);
>  }
>  
> +static inline struct pwm_device *of_pwm_request(struct device_node *np,
> +						const char *con_id)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
>  static inline void pwm_put(struct pwm_device *pwm)
>  {
>  }
> -- 
> 1.8.0
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
