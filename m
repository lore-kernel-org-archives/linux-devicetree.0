From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] nvmem: imx-ocotp: add i.MX7ULP support
Date: Tue, 15 Jan 2019 12:16:50 +0000
Message-ID: <4a1f2741-cb03-9f72-8039-1f82eb854b2c@linaro.org>
References: <1544777136-9195-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544777136-9195-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org



On 14/12/2018 08:51, Anson Huang wrote:
> i.MX7ULP is a new SoC of i.MX family which has 8 kbit eFuse OTP,
> enable ocotp driver support for this SoC.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>   drivers/nvmem/imx-ocotp.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
Thanks Applied both patches!

--srini
