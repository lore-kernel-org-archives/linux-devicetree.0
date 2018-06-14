From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 17/27] bindings: nvmem/zii: Fix location of nvmem.txt
Date: Thu, 14 Jun 2018 17:52:11 +0100
Message-ID: <c6dd6c36-2b75-cc9e-ea9e-5ee70eb656e6@linaro.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
 <fcfc83951a2997c527126af1fdd6fb1e0acbe27d.1528990947.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fcfc83951a2997c527126af1fdd6fb1e0acbe27d.1528990947.git.mchehab+samsung@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 14/06/18 17:09, Mauro Carvalho Chehab wrote:
> The location pointed there is missing "bindings/" on its path.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> index d5e22fc67d66..0df79d9e07ec 100644
> --- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> +++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
> @@ -18,7 +18,7 @@ Optional properties:
>   Data cells:
>   
>   Data cells are child nodes of eerpom node, bindings for which are
> -documented in Documentation/bindings/nvmem/nvmem.txt
> +documented in Documentation/devicetree/bindings/nvmem/nvmem.txt
>   
>   Example:
>   
> 
