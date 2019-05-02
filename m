From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH 1/3] usb: usb251xb: Add US lanes inversion dts-bindings
Date: Thu, 2 May 2019 07:42:14 +0200
Message-ID: <238927ae-c2c3-dcb5-b6c2-824fbf127759@skidata.com>
References: <20190424211208.17499-1-fancer.lancer@gmail.com>
 <20190424211208.17499-2-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424211208.17499-2-fancer.lancer@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Serge Semin <Sergey.Semin@t-platforms.ru>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 24/04/2019 23:12, Serge Semin wrote:
> Since a separate US ports lanes polarity inversion property is going to
> be available the bindings doc-file should be updated with information
> about swap-us-lanes bool property, which will be responsible for it.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Richard Leitner <richard.leitner@skidata.com>
