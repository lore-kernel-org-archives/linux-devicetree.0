From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: eeprom: rename to at24.txt
Date: Thu, 7 Dec 2017 16:56:44 +0100
Message-ID: <CAMRc=Mfv9KY7LhWKOK-X8VaYNVrW+FkD85DXC7Aqmwq0DwAPTg@mail.gmail.com>
References: <20171207103829.3342-1-wsa@the-dreams.de> <20171207103829.3342-2-wsa@the-dreams.de>
 <CAL_JsqL_Qd5XYX0OthiqGYaQm=h0YCjV3=zqocQjzNYEoQn6PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL_Qd5XYX0OthiqGYaQm=h0YCjV3=zqocQjzNYEoQn6PA@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

2017-12-07 16:41 GMT+01:00 Rob Herring <robh@kernel.org>:
> On Thu, Dec 7, 2017 at 4:38 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> This binding documentation is for the at24 driver, so the filename
>> should reflect it. This avoids confusion because we also have an
>> "eeprom" driver in Linux but it doesn't support DT even.
>>
>> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
>> ---
>>  Documentation/devicetree/bindings/eeprom/{eeprom.txt => at24.txt} | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename Documentation/devicetree/bindings/eeprom/{eeprom.txt => at24.txt} (100%)
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thanks!
