From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] usb: usb251xb: Add US lanes inversion dts-bindings
Date: Wed, 1 May 2019 19:32:45 -0500
Message-ID: <20190502003245.GA19265@bogus>
References: <20190424211208.17499-1-fancer.lancer@gmail.com>
 <20190424211208.17499-2-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424211208.17499-2-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Richard Leitner <richard.leitner@skidata.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Serge Semin <Sergey.Semin@t-platforms.ru>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 25 Apr 2019 00:12:05 +0300, Serge Semin wrote:
> Since a separate US ports lanes polarity inversion property is going to
> be available the bindings doc-file should be updated with information
> about swap-us-lanes bool property, which will be responsible for it.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
