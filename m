Return-Path: <Ashutosh.s@phytec.in>
Message-ID: <53045225.50509@phytec.in>
Date: Wed, 19 Feb 2014 12:11:41 +0530
From: Ashutosh <Ashutosh.s@phytec.in>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/4] Phytec phyFLEX-i.MX6 : Added USB_OTG Support
References: <1392731185-4885-1-git-send-email-ashutosh.s@phytec.in> <20140219022307.GL15716@S2101-09.ap.freescale.net> <20140219055824.GB3010@S2101-09.ap.freescale.net>
In-Reply-To: <20140219055824.GB3010@S2101-09.ap.freescale.net>
Content-Type: multipart/alternative;
 boundary="------------090501070201030306090704"
To: Shawn Guo <shawn.guo@linaro.org>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, s.hauer@pengutronix.de, c.hemp@phytec.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, festevam@gmail.com
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090501070201030306090704
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1; format=flowed

> On Wed, Feb 19, 2014 at 10:23:09AM +0800, Shawn Guo wrote:
>>> @@ -18,6 +18,14 @@
>>>   	memory {
>>>   		reg = <0x10000000 0x80000000>;
>>>   	};
>>> +
>>> +	reg_usb_otg_vbus: regulator@0 {
>> You do not have a 'reg' property in the node, so you shouldn't have
>> '@num' in node name.  You may want to name it 'regulator-0'.
> I just saw the talk between Stephen and Mark [1], and I'm with Stephen
> that neither regulator-0 nor regulator_0 is a good name.  Since Mark is
> giving up the argument on the container, please follow the way we do in
> other IMX dts today.
>
> Shawn
>
> [1] http://thread.gmane.org/gmane.linux.drivers.devicetree/61894/focus=62405
>
By seeing the discussion would the below changes is appropriate

regulators {
                 compatible = "simple-bus";
                 #address-cells = <1>;
                 #size-cells = <0>;

                 reg_usb_otg_vbus: regulator@0 {
                                compatible = "regulator-fixed";
                                 reg = <0>;
                                 regulator-name = "usb_otg_vbus";
                                 regulator-min-microvolt = <5000000>;
                                 regulator-max-microvolt = <5000000>;
                                 gpio = <&gpio4 15 0>;
                 };

But as Mark [1] suggested not to use simple bus. Which one is more 
appropriate ?

[1] http://www.spinics.net/lists/linux-usb/msg101477.html

>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "usb_otg_vbus";
>>> +		regulator-min-microvolt = <5000000>;
>>> +		regulator-max-microvolt = <5000000>;
>>> +		gpio = <&gpio4 15 0>;
>>> +	};
>>>   };

--------------090501070201030306090704
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset=ISO-8859-1

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <blockquote
      cite="mid:20140219055824.GB3010@S2101-09.ap.freescale.net"
      type="cite">
      <pre wrap="">On Wed, Feb 19, 2014 at 10:23:09AM +0800, Shawn Guo wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">@@ -18,6 +18,14 @@
 	memory {
 		reg = &lt;0x10000000 0x80000000&gt;;
 	};
+
+	reg_usb_otg_vbus: regulator@0 {
</pre>
        </blockquote>
        <pre wrap="">
You do not have a 'reg' property in the node, so you shouldn't have
'@num' in node name.  You may want to name it 'regulator-0'.
</pre>
      </blockquote>
      <pre wrap="">
I just saw the talk between Stephen and Mark [1], and I'm with Stephen
that neither regulator-0 nor regulator_0 is a good name.  Since Mark is
giving up the argument on the container, please follow the way we do in
other IMX dts today.

Shawn

[1] <a class="moz-txt-link-freetext" href="http://thread.gmane.org/gmane.linux.drivers.devicetree/61894/focus=62405">http://thread.gmane.org/gmane.linux.drivers.devicetree/61894/focus=62405</a>

</pre>
    </blockquote>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    By seeing the discussion would the below changes is appropriate <br>
    <br>
    regulators {<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible = "simple-bus";<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells = &lt;1&gt;;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells = &lt;0&gt;;<br>
    <br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg_usb_otg_vbus: regulator@0 {<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; compatible = "regulator-fixed";<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg = &lt;0&gt;;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; regulator-name = "usb_otg_vbus";<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; regulator-min-microvolt =
    &lt;5000000&gt;;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; regulator-max-microvolt =
    &lt;5000000&gt;;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; gpio = &lt;&amp;gpio4 15 0&gt;;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
    <br>
    But as Mark [1] suggested not to use simple bus. Which one is more
    appropriate ? <br>
    <br>
    [1] <a href="http://www.spinics.net/lists/linux-usb/msg101477.html">http://www.spinics.net/lists/linux-usb/msg101477.html</a><br>
    <br>
    <blockquote
      cite="mid:20140219055824.GB3010@S2101-09.ap.freescale.net"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">
</pre>
        <blockquote type="cite">
          <pre wrap="">+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = &lt;5000000&gt;;
+		regulator-max-microvolt = &lt;5000000&gt;;
+		gpio = &lt;&amp;gpio4 15 0&gt;;
+	};
 };
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------090501070201030306090704--
