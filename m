From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of_i2c: I2C child node 10-bit client addressing
Date: Wed, 14 Nov 2012 16:27:16 +0000
Message-ID: <20121114162716.157433E0B7C@localhost>
References: <BLU002-W134A2F0BA0EF1C3BF8E491EAC8C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BLU002-W134A2F0BA0EF1C3BF8E491EAC8C0-MsuGFMq8XAE@public.gmane.org>
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
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bharat Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Oct 2012 09:12:48 +0530, Bharat Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> I2C clients which has 10 bit address, struct i2c_board_info,
> member "flags = I2C_CLIENT_TEN" is needed.
> 
> Signed-off-by: Bharat Kumar Reddy Gooty <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/of/of_i2c.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
> index 1e173f3..9cda7e2 100644
> --- a/drivers/of/of_i2c.c
> +++ b/drivers/of/of_i2c.c
> @@ -57,6 +57,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>                         continue;
>                 }   
>  
> +               /* Support for i2c 10 bit client address */
> +               if ((info.addr > (1 << 7) - 1) && (info.addr <= (1 << 10) - 1))
> +                       info.flags = I2C_CLIENT_TEN;
> +

Is it possible for a device to have an address that fits in the first 7
bits, but still requires 10 bit address transactions?

g.
