From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] pinctrl: pinctrl-st.c: Cleaning up if unsigned is less
 than zero
Date: Thu, 26 Jun 2014 12:47:55 +0100
Message-ID: <53AC086B.80406@linaro.org>
References: <1403782369-10201-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403782369-10201-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Linus Walleij <linus.walleij@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 26/06/14 12:32, Rickard Strandqvist wrote:
> Remove checking if a unsigned is less than zero
>
> This was found using a static code analysis program called cppcheck.
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
> ---
>   drivers/pinctrl/pinctrl-st.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index 1bd6363bc9..f4ee1b1 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -1256,7 +1256,7 @@ static int st_pctl_parse_functions(struct device_node *np,
>   	func = &info->functions[index];
>   	func->name = np->name;
>   	func->ngroups = of_get_child_count(np);
> -	if (func->ngroups <= 0) {
> +	if (func->ngroups == 0) {

Makes sense

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   		dev_err(info->dev, "No groups defined\n");
>   		return -EINVAL;
>   	}
>
