Return-Path: <SRS0=Y2Sd=II=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH] of: unittest: for strings, account for trailing \0 in
 property length field
References: <20180519232943.GA12474@sjc-ads-587.cisco.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <f48467c4-d3f6-10de-48f9-1cd208ee3b55@gmail.com>
Date: Mon, 21 May 2018 10:26:42 -0700
MIME-Version: 1.0
In-Reply-To: <20180519232943.GA12474@sjc-ads-587.cisco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stefan M Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 05/19/18 16:29, Stefan M Schaeckeler wrote:
> For strings, account for trailing \0 in property length field:
> 
> This is consistent with how dtc builds string properties.
> 
> Function __of_prop_dup() would misbehave on such properties as it duplicates
> properties based on the property length field creating new string values
> without trailing \0s.
> 
> Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
> ---
>  drivers/of/unittest.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 6bb37c1..75a2abe 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -165,20 +165,20 @@ static void __init of_unittest_dynamic(void)
>  	/* Add a new property - should pass*/
>  	prop->name = "new-property";
>  	prop->value = "new-property-data";
> -	prop->length = strlen(prop->value);
> +	prop->length = strlen(prop->value)+1;

Please put a space before and after the plus sign:  ... strlen(prop->value) + 1;

Same for each of the changes below.

With those changes, you can add:

   Reviewed-by: Frank Rowand <frank.rowand@sony.com>
   Tested-by: Frank Rowand <frank.rowand@sony.com>

-Frank

>  	unittest(of_add_property(np, prop) == 0, "Adding a new property failed\n");
>  
>  	/* Try to add an existing property - should fail */
>  	prop++;
>  	prop->name = "new-property";
>  	prop->value = "new-property-data-should-fail";
> -	prop->length = strlen(prop->value);
> +	prop->length = strlen(prop->value)+1;
>  	unittest(of_add_property(np, prop) != 0,
>  		 "Adding an existing property should have failed\n");
>  
>  	/* Try to modify an existing property - should pass */
>  	prop->value = "modify-property-data-should-pass";
> -	prop->length = strlen(prop->value);
> +	prop->length = strlen(prop->value)+1;
>  	unittest(of_update_property(np, prop) == 0,
>  		 "Updating an existing property should have passed\n");
>  
> @@ -186,7 +186,7 @@ static void __init of_unittest_dynamic(void)
>  	prop++;
>  	prop->name = "modify-property";
>  	prop->value = "modify-missing-property-data-should-pass";
> -	prop->length = strlen(prop->value);
> +	prop->length = strlen(prop->value)+1;
>  	unittest(of_update_property(np, prop) == 0,
>  		 "Updating a missing property should have passed\n");
>  
> 
