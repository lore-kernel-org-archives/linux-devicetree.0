Return-Path: <SRS0=A1Iz=U2=ti.com=jjhiblot@kernel.org>
Subject: Re: devicetree bindings for a generic led-based backlight driver
References: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
 <400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <283a3b7c-c3ed-719e-14e3-fc73e08af880@ti.com>
Date: Thu, 27 Jun 2019 15:14:38 +0200
MIME-Version: 1.0
In-Reply-To: <400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com>
Content-Type: multipart/alternative;
	boundary="------------BF6DAD85A568EE069B5690C3"
Content-Language: en-US
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, pavel@ucw.cz, linux-leds@vger.kernel.org, robh@kernel.org, "Valkeinen, Tomi" <tomi.valkeinen@ti.com>
List-ID: <devicetree@vger.kernel.org>

--------------BF6DAD85A568EE069B5690C3
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jacek,

On 26/06/2019 20:55, Jacek Anaszewski wrote:
> Hi Jean,
>
> On 6/26/19 5:34 PM, Jean-Jacques Hiblot wrote:
>> Hi,
>>
>> A few years ago (2015), Tomi Valkeinen posted a series implementing a
>> backlight driver on top of a LED device.
>>
>> https://patchwork.kernel.org/patch/7293991/
>> https://patchwork.kernel.org/patch/7294001/
>> https://patchwork.kernel.org/patch/7293981/
>>
>> The discussion stopped  because he lacked the time to work on it.
>>
>> I will be taking over the task and, before heading in the wrong
>> direction, wanted a confirmation that the binding Tomi last proposed in
>> hist last email was indeed the preferred option.
>>
>> It will probably require some modifications in the LED core to create
>> the right kind of led-device (normal, flash or backlight) based on the
>> compatible option.
> I recall that discussion. I gave my ack for the LED changes but
> now we have more LED people that might want to look into that.

Regarding the LED bindings as discussed by Tom and Rob in 
https://patchwork.kernel.org/patch/7293991/, what do you think of using 
a 'compatible' string to make a LED device also a backlight or a flash LED ?

Here is the example from Tomi at the end of the discussion:

/* tlc59108 is an i2c device */
tlc59116@40 {
	#address-cells = <1>;
	#size-cells = <0>;
	compatible = "ti,tlc59108";
	reg = <0x40>;

	wan@0 {
		label = "wrt1900ac:amber:wan";
		reg = <0x0>;
	};

	bl@2 {
		label = "backlight";
		reg = <0x2>;

		compatible = "led-backlight";
		brightness-levels = <0 243 245 247 248 249 251 252 255>;
		default-brightness-level = <8>;

		enable-gpios = <&pcf_lcd 13 GPIO_ACTIVE_LOW>;
	};
};

>
> Regarding the bindings we have pending LED naming patch set,
> that deprecates DT label property [0] and introduces standardized
> LED functions.
>
> [0] https://lkml.org/lkml/2019/6/9/728

Thanks for the info.



--------------BF6DAD85A568EE069B5690C3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Jacek,<br>
    </p>
    <div class="moz-cite-prefix">On 26/06/2019 20:55, Jacek Anaszewski
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Jean,

On 6/26/19 5:34 PM, Jean-Jacques Hiblot wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

A few years ago (2015), Tomi Valkeinen posted a series implementing a
backlight driver on top of a LED device.

<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/7293991/">https://patchwork.kernel.org/patch/7293991/</a>
<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/7294001/">https://patchwork.kernel.org/patch/7294001/</a>
<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/7293981/">https://patchwork.kernel.org/patch/7293981/</a>

The discussion stopped  because he lacked the time to work on it.

I will be taking over the task and, before heading in the wrong
direction, wanted a confirmation that the binding Tomi last proposed in
hist last email was indeed the preferred option.

It will probably require some modifications in the LED core to create
the right kind of led-device (normal, flash or backlight) based on the
compatible option.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I recall that discussion. I gave my ack for the LED changes but
now we have more LED people that might want to look into that.</pre>
    </blockquote>
    <p>Regarding the LED bindings as discussed by Tom and Rob in
      <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/7293991/">https://patchwork.kernel.org/patch/7293991/</a>, what do you think of
      using a 'compatible' string to make a LED device also a backlight
      or a flash LED ?<br>
    </p>
    <p>Here is the example from Tomi at the end of the discussion:<br>
    </p>
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">/* tlc59108 is an i2c device */
tlc59116@40 {
	#address-cells = &lt;1&gt;;
	#size-cells = &lt;0&gt;;
	compatible = "ti,tlc59108";
	reg = &lt;0x40&gt;;

	wan@0 {
		label = "wrt1900ac:amber:wan";
		reg = &lt;0x0&gt;;
	};

	bl@2 {
		label = "backlight";
		reg = &lt;0x2&gt;;

		compatible = "led-backlight";
		brightness-levels = &lt;0 243 245 247 248 249 251 252 255&gt;;
		default-brightness-level = &lt;8&gt;;

		enable-gpios = &lt;&amp;pcf_lcd 13 GPIO_ACTIVE_LOW&gt;;
	};
};</pre>
    <blockquote type="cite"
      cite="mid:400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Regarding the bindings we have pending LED naming patch set,
that deprecates DT label property [0] and introduces standardized
LED functions.

[0] <a class="moz-txt-link-freetext" href="https://lkml.org/lkml/2019/6/9/728">https://lkml.org/lkml/2019/6/9/728</a>
</pre>
    </blockquote>
    <p>Thanks for the info.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BF6DAD85A568EE069B5690C3--
