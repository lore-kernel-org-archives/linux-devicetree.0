From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Documentation: dt: iio: accel: add lng2dm sensor
 device binding
Date: Sun, 30 Oct 2016 16:53:50 +0000
Message-ID: <e99f9b73-094e-2f73-a077-aac7d078ab5c@kernel.org>
References: <1477429744-27713-1-git-send-email-lorenzo.bianconi@st.com>
 <1477429744-27713-3-git-send-email-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477429744-27713-3-git-send-email-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25/10/16 22:09, Lorenzo Bianconi wrote:
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Applied.
> ---
>  Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documentation/devicetree/bindings/iio/st-sensors.txt
> index e41fe34..c040c9a 100644
> --- a/Documentation/devicetree/bindings/iio/st-sensors.txt
> +++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
> @@ -42,6 +42,7 @@ Accelerometers:
>  - st,lsm303agr-accel
>  - st,lis2dh12-accel
>  - st,h3lis331dl-accel
> +- st,lng2dm-accel
>  
>  Gyroscopes:
>  - st,l3g4200d-gyro
> 
