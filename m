From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: unittest: let dtc generate __local_fixups__
Date: Thu, 16 Nov 2017 13:34:15 -0500
Message-ID: <fb992198-d55c-0d06-3f19-0444d0c292d3@gmail.com>
References: <20171116180545.12322-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116180545.12322-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/16/17 13:05, Rob Herring wrote:
> Remove the manually added __local_fixups__ because dtc can now generate
> them. This also fixes a new warning in the process:
> 
> drivers/of/unittest-data/testcases.dtb: Warning (interrupts_extended_property): Could not get phandle node for /__local_fixups__/testcase-data/interrupts/interrupts-extended0:interrupts-extended(cell 3)
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/unittest-data/testcases.dts | 56 ++--------------------------------
>  1 file changed, 2 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dts
> index 12f7c3d649c8..ac616ad18ea6 100644
> --- a/drivers/of/unittest-data/testcases.dts
> +++ b/drivers/of/unittest-data/testcases.dts
> @@ -1,4 +1,6 @@
>  /dts-v1/;
> +/plugin/;
> +
>  / {
>  	testcase-data {
>  		changeset {
> @@ -23,57 +25,3 @@
>   * The format of this data may be subject to change. For the time being consider
>   * this a kernel-internal data format.
>   */
> -/ { __local_fixups__ {
> -	testcase-data {
> -		phandle-tests {
> -			consumer-a {

< snip >

You should also delete the comment immediately above that describes the removed lines.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
