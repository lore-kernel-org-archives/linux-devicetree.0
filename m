From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: RE: [PATCH -next] mmc: dw_mmc: fix error return code in dw_mci_probe()
Date: Tue, 23 Apr 2013 18:59:21 +0900
Message-ID: <002301ce4009$3a3099b0$ae91cd10$%jun@samsung.com>
References: <CAPgLHd9RGHwoitQ0EusPepKK+AApKJ=ryRbm4S32o_vOonUgeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-reply-to: <CAPgLHd9RGHwoitQ0EusPepKK+AApKJ=ryRbm4S32o_vOonUgeQ@mail.gmail.com>
Content-language: ko
Sender: linux-mmc-owner@vger.kernel.org
To: 'Wei Yongjun' <weiyj.lk@gmail.com>, jh80.chung@samsung.com, cjb@laptop.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Friday, April 19, 2013 , Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix to return -ENOMEM in alloc workqueue error case instead
> of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Acked-by: Seungwon Jeon <tgih.jun@samsung.com>

