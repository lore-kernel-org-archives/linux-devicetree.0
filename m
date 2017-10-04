From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH 3/9 v2] usb: usb251xb: Add 5,6,7 ports mapping def setting
Date: Wed, 4 Oct 2017 09:51:01 +0200
Message-ID: <2ad7bb5b-d8cb-65f3-7b03-be5972d7acd3@skidata.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-4-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170916104220.3742-4-fancer.lancer@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
List-Id: devicetree@vger.kernel.org


On 09/16/2017 12:42 PM, Serge Semin wrote:
> USB2517 got three additionl downstream ports, which can
> as well be mapped to another logical ports. USB2551xb driver

typo in "USB251xb"

> currently doesn't fully support such setting configuration
> from dts file. This patch doesn't change this, but adds
> usb2517 spcific ports default liner mapping.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/usb/misc/usb251xb.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Code itself looks good to me, therefore feel free to add:

Acked-by: Richard Leitner <richard.leitner@skidata.com>

regards,
Richard.L
