From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 3/4] devicetree: add SGX Sensortech vendor id
Date: Sun, 20 Sep 2015 19:58:18 +0100
Message-ID: <55FF01CA.4020201@kernel.org>
References: <1442201174-10975-1-git-send-email-mranostay@gmail.com>
 <1442201174-10975-4-git-send-email-mranostay@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442201174-10975-4-git-send-email-mranostay@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Ranostay <mranostay@gmail.com>, lars@metafoo.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/09/15 04:26, Matt Ranostay wrote:
> Signed-off-by: Matt Ranostay <mranostay@gmail.com>
Applied. Note there was fuzz in my tree as I am lagging mainline
somewhat.  However it is pretty obvious how to fix up merge
issues in this file so lets not worry about that ;)

Jonathan
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index ac5f0c3..281e8f0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -191,6 +191,7 @@ sbs	Smart Battery System
>  schindler	Schindler
>  seagate	Seagate Technology PLC
>  semtech	Semtech Corporation
> +sgx	SGX Sensortech
>  sharp	Sharp Corporation
>  sil	Silicon Image
>  silabs	Silicon Laboratories
> 
