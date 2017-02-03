From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: [PATCH] devicetree: Add video bus switch
Date: Fri, 3 Feb 2017 13:35:08 +0100
Message-ID: <20170203123508.GA10286@amd>
References: <20161023200355.GA5391@amd>
 <20161119232943.GF13965@valkosipuli.retiisi.org.uk>
 <20161214122451.GB27011@amd>
 <20161222100104.GA30917@amd>
 <20161222133938.GA30259@amd>
 <20161224152031.GA8420@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161224152031.GA8420@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


N900 contains front and back camera, with a switch between the
two. This adds support for the switch component, and it is now
possible to select between front and back cameras during runtime.

This adds documentation for the devicetree binding.

Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>


diff --git a/Documentation/devicetree/bindings/media/video-bus-switch.txt b=
/Documentation/devicetree/bindings/media/video-bus-switch.txt
new file mode 100644
index 0000000..1b9f8e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/video-bus-switch.txt
@@ -0,0 +1,63 @@
+Video Bus Switch Binding
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This is a binding for a gpio controlled switch for camera interfaces. Such=
 a
+device is used on some embedded devices to connect two cameras to the same
+interface of a image signal processor.
+
+Required properties
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+compatible	: must contain "video-bus-switch"
+switch-gpios	: GPIO specifier for the gpio, which can toggle the
+		  selected camera. The GPIO should be configured, so
+		  that a disabled GPIO means, that the first port is
+		  selected.
+
+Required Port nodes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+More documentation on these bindings is available in
+video-interfaces.txt in the same directory.
+
+reg		: The interface:
+		  0 - port for image signal processor
+		  1 - port for first camera sensor
+		  2 - port for second camera sensor
+
+Example
+=3D=3D=3D=3D=3D=3D=3D
+
+video-bus-switch {
+	compatible =3D "video-bus-switch"
+	switch-gpios =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
+
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		port@0 {
+			reg =3D <0>;
+
+			csi_switch_in: endpoint {
+				remote-endpoint =3D <&csi_isp>;
+			};
+		};
+
+		port@1 {
+			reg =3D <1>;
+
+			csi_switch_out1: endpoint {
+				remote-endpoint =3D <&csi_cam1>;
+			};
+		};
+
+		port@2 {
+			reg =3D <2>;
+
+			csi_switch_out2: endpoint {
+				remote-endpoint =3D <&csi_cam2>;
+			};
+		};
+	};
+};



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAliUePwACgkQMOfwapXb+vKJTQCfQduvtz/0WVlKURllpoCZ5ftu
E7AAoJIJkHA98p8p88THy+Jhv7cCUu/q
=+2+b
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
