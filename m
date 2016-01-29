From: =?UTF-8?B?6YOR6Ziz?= <yang.zheng@rock-chips.com>
Subject: Re: [PATCH v2 1/2] drm: rockchip/hdmi: add Innosilicon HDMI support
Date: Fri, 29 Jan 2016 14:17:10 +0800
Message-ID: <56AB03E6.6020107@rock-chips.com>
References: <1452160896-27096-1-git-send-email-ykk@rock-chips.com>
 <1452161024-27198-1-git-send-email-ykk@rock-chips.com>
Reply-To: yang.zheng@rock-chips.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0454770880=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1452161024-27198-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ken Mixte <kmixter@google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============0454770880==
Content-Type: multipart/alternative;
 boundary="------------000205060708040802030603"

This is a multi-part message in MIME format.
--------------000205060708040802030603
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2016=E5=B9=B401=E6=9C=8807=E6=97=A5 18:03, Yakir Yang =E5=86=99=
=E9=81=93:
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/roc=
kchip/inno_hdmi.c
> new file mode 100644
> index 0000000..9327617
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
>
> +static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi)
> +{
> +
> +	if (hdmi->hdmi_data.enc_out_format =3D=3D HDMI_COLORSPACE_RGB) +=20
> avi_color_mode =3D AVI_COLOR_MODE_RGB;
> +	else if (hdmi->hdmi_data.enc_out_format =3D=3D HDMI_COLORSPACE_YUV444=
)
> +		avi_color_mode =3D AVI_COLOR_MODE_YCBCR444;
> +	else if (hdmi->hdmi_data.enc_out_format =3D=3D HDMI_COLORSPACE_YUV422=
)
> +		avi_color_mode =3D AVI_COLOR_MODE_YCBCR422;
> +	else
> +		avi_color_mode =3D AVI_COLOR_MODE_RGB;
> +
Fist if is no need, its result is same to "else".
> +static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
> +{
>
> +	if (data->enc_out_format =3D=3D data->enc_out_format)  {
> +		if ((data->enc_in_format =3D=3D HDMI_COLORSPACE_RGB) ||
> +		    (data->enc_in_format >=3D HDMI_COLORSPACE_YUV444)) {
> +			value =3D v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
> +			hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
> +
> +			hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
> +				  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
> +				  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
> +				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
> +			return 0;
> +		}
> +	}
>
It seems should be if (data->enc_in_format =3D=3D data->enc_out_format).


--------------000205060708040802030603
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    =E5=9C=A8 2016=E5=B9=B401=E6=9C=8807=E6=97=A5 18:03, Yakir Yang =E5=86=
=99=E9=81=93:<br>
    <blockquote
      cite=3D"mid:1452161024-27198-1-git-send-email-ykk@rock-chips.com"
      type=3D"cite">
      <pre wrap=3D"">diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/=
drivers/gpu/drm/rockchip/inno_hdmi.c
new file mode 100644
index 0000000..9327617
--- /dev/null
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c

+static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi)
+{
+
+	<font color=3D"#ff0000">if (hdmi-&gt;hdmi_data.enc_out_format =3D=3D HD=
MI_COLORSPACE_RGB)
+		avi_color_mode =3D AVI_COLOR_MODE_RGB</font>;
+	else if (hdmi-&gt;hdmi_data.enc_out_format =3D=3D HDMI_COLORSPACE_YUV44=
4)
+		avi_color_mode =3D AVI_COLOR_MODE_YCBCR444;
+	else if (hdmi-&gt;hdmi_data.enc_out_format =3D=3D HDMI_COLORSPACE_YUV42=
2)
+		avi_color_mode =3D AVI_COLOR_MODE_YCBCR422;
+	else
+		avi_color_mode =3D AVI_COLOR_MODE_RGB;
+</pre>
    </blockquote>
    =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 <font color=3D"#000099">F=
ist if is no need, its result is
      same to "else".</font><br>
    <blockquote
      cite=3D"mid:1452161024-27198-1-git-send-email-ykk@rock-chips.com"
      type=3D"cite">
      <pre wrap=3D"">+static int inno_hdmi_config_video_csc(struct inno_h=
dmi *hdmi)
+{

+	<font color=3D"#ff0000">if (data-&gt;enc_out_format =3D=3D data-&gt;enc=
_out_format)</font> {
+		if ((data-&gt;enc_in_format =3D=3D HDMI_COLORSPACE_RGB) ||
+		    (data-&gt;enc_in_format &gt;=3D HDMI_COLORSPACE_YUV444)) {
+			value =3D v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
+			hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
+
+			hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
+				  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
+				  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
+				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
+			return 0;
+		}
+	}

</pre>
    </blockquote>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 <font color=3D"#000099">It seem=
s should be if
      (data-&gt;enc_in_format =3D=3D data-&gt;enc_out_format).<br>
    </font><br>
  </body>
</html>

--------------000205060708040802030603--


--===============0454770880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0454770880==--
