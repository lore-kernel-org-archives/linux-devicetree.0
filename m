From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 2/2] dt/bindings: display: move rotation into a common
 place
Date: Tue, 16 May 2017 19:15:35 +0200
Message-ID: <a7463d70-77b4-b5f5-5053-b46f79d2f162@tronnes.org>
References: <eabeec88c2831eb8541b78a4977ee7342b810b39.1494922745.git.baruch@tkos.co.il>
 <f2a6516fff9b8f5ac67aabd60527c1d9b3149482.1494922745.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f2a6516fff9b8f5ac67aabd60527c1d9b3149482.1494922745.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Den 16.05.2017 10.19, skrev Baruch Siach:
> Commit b60c1be74741 (dt-bindings: display/panel: Add common rotation property)
> added the rotation property description in a new file. We have a place for
> common display panel properties already. Move there the rotation property.
>
> Cc: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---

Acked-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>

>   Documentation/devicetree/bindings/display/panel/panel-common.txt | 6 ++++++
>   Documentation/devicetree/bindings/display/panel/panel.txt        | 4 ----
>   2 files changed, 6 insertions(+), 4 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/panel/panel.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.txt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> index 0603af877155..c92dcfd8c32f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> @@ -89,3 +89,9 @@ backlight controller.
>   
>   - backlight: For panels whose backlight is controlled by an external backlight
>     controller, this property contains a phandle that references the controller.
> +
> +
> +Rotation
> +--------
> +
> +- rotation: Display rotation in degrees counter clockwise (0,90,180,270)
> diff --git a/Documentation/devicetree/bindings/display/panel/panel.txt b/Documentation/devicetree/bindings/display/panel/panel.txt
> deleted file mode 100644
> index e2e6867852b8..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panel.txt
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -Common display properties
> --------------------------
> -
> -- rotation:	Display rotation in degrees counter clockwise (0,90,180,270)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
