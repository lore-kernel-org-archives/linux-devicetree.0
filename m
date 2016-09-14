From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [RFC/PATCH] usb: misc: Add a driver for TC7USB40MU
Date: Wed, 14 Sep 2016 01:55:02 -0700
Message-ID: <147384330268.13546.17843140335600627152@sboyd-linaro>
References: <20160914014246.31847-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160914014246.31847-1-stephen.boyd@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2016-09-13 18:42:46)
> On the db410c 96boards platform we have a TC7USB40MU[1] on the
> board to mux the D+/D- lines from the SoC between a micro usb
> "device" port and a USB hub for "host" roles. Upon a role switch,
> we need to change this mux to forward the D+/D- lines to either
> the port or the hub. Therefore, introduce a driver for this
> device that intercepts extcon USB_HOST events and logically
> asserts a gpio to mux the "host" D+/D- lines when a host cable is
> attached. When the cable goes away, it will logically deassert
> the gpio and mux the "device" lines.
> =

> [1] https://toshiba.semicon-storage.com/ap-en/product/logic/bus-switch/de=
tail.TC7USB40MU.html
> =

> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
> =

> Should I make the extcon part optional? I could see a case where there ar=
e two
> "OTG" ports connected to the mux (or two hubs), and for some reason the
> software may want to mux between them at runtime. If we mandate an extcon,
> that won't be possible to support. Perhaps it would be better to have
> the node, but connect it to the usb controller with a phandle (maybe of_g=
raph
> endpoints would be useful too) so that when the controller wants to mux o=
ver
> a port it can do so.

Here's some dts mock-up on top of the db410c for the of_graph stuff. I
haven't written any code around it, but the idea is to allow the binding
to specify how the mux is connected to upstream and downstream D+/D-
lines. This way, we can do some dt parsing of the endpoints and their
parent nodes to figure out if the mux needs to be set high or low to use
a device connector or a usb hub based on if the id cable is present.
Maybe I'm over thinking things though and we could just have a DT
property for that.

	soc {
		usb@78d9000 {
			extcon =3D <&usb_id>, <&usb_id>;
			usb-controller; // needed?

			ports {
				#address-cells =3D <1>;
				#size-cells =3D <0>;

				port@0 {
					#address-cells =3D <1>;
					#size-cells =3D <0>;
					reg =3D <0>;

					usb_output: endpoint@0 { // USB D+/D-
						reg =3D <0>;
						remote-endpoint =3D <&usb_switch_input>;
					};
				};
			};
		};
	};

	usb2513 {
		compatible =3D "smsc,usb3503";
		reset-gpios =3D <&pm8916_gpios 3 GPIO_ACTIVE_LOW>;
		initial-mode =3D <1>;
		usb-hub; // indicate this is a hub

		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			port@0 {
				#address-cells =3D <1>;
				#size-cells =3D <0>;
				reg =3D <0>;

				usb_hub_input: endpoint@0 { // USB{DP,DM}_UP
					reg =3D <0>;
					remote-endpoint =3D <&usb_switch_hub_ep>;
				};

				usb_hub_output1: endpoint@1 { // USB{DP,DM}_DN1
					reg =3D <1>;
					remote-endpoint =3D <&usb_a2_connector>;
				};

				usb_hub_output2: endpoint@2 { // USB{DP,DM}_DN2
					reg =3D <2>;
					remote-endpoint =3D <&usb_a1_connector>;
				};

				usb_hub_output3: endpoint@3 { // USB{DP,DM}_DN3
					reg =3D <3>;
					// goes to expansion connector
				};
			};
		};
	};

	usb_id: usb-id {
		compatible =3D "linux,extcon-usb-gpio";
		id-gpio =3D <&msmgpio 121 GPIO_ACTIVE_HIGH>;
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&usb_id_default>;
	};

	usb-switch {
		compatible =3D "toshiba,tc7usb40mu";
		switch-gpios =3D <&pm8916_gpios 4 GPIO_ACTIVE_HIGH>;
		extcon =3D <&usb_id>;
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&usb_sw_sel_pm>;

		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			port@0 {
				#address-cells =3D <1>;
				#size-cells =3D <0>;
				reg =3D <0>;

				usb_switch_input: endpoint@0 { // D+/D-
					reg =3D <0>;
					remote-endpoint =3D <&usb_output>;
				};

				usb_switch_device_ep: endpoint@1 { // D1+/D1-
					reg =3D <1>;
					remote-endpoint =3D <&usb_ub_connector>;
				};

				usb_switch_hub_ep: endpoint@2 { // D2+/D2-
					reg =3D <2>;
					remote-endpoint =3D <&usb_hub_input>;
				};
			};
		};
	};

	uB-connector {
		compatible =3D "usb-ub-connector";
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		usb-connector;
		port@0 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <0>;
			usb_ub_connector: endpoint@0 {
				reg =3D <0>;
				remote-endpoint =3D <&usb_switch_device_ep>;
			};
		};
	};

	usb-A-connector1 {
		compatible =3D "usb-A-connector";
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		usb-connector;
		port@0 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <0>;
			usb_a1_connector: endpoint@0 {
				reg =3D <0>;
				remote-endpoint =3D <&usb_hub_output2>;
			};
		};
	};

	usb-A-connector2 {
		compatible =3D "usb-A-connector";
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		usb-connector;
		port@0 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <0>;
			usb_a2_connector: endpoint@0 {
				reg =3D <0>;
				remote-endpoint =3D <&usb_hub_output1>;
			};
		};
	};
};
