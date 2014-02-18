From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 2/3] usb: chipidea: msm: Add device tree support
Date: Tue, 18 Feb 2014 21:31:55 +0300
Message-ID: <5303A71B.7060208@cogentembedded.com>
References: <1392729681-21022-1-git-send-email-iivanov@mm-sol.com>	 <1392729681-21022-3-git-send-email-iivanov@mm-sol.com>	 <53039E2E.2030503@cogentembedded.com> <1392743648.17130.17.camel@iivanov-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392743648.17130.17.camel@iivanov-dev>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Peter Chen <Peter.Chen@freescale.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/18/2014 08:14 PM, Ivan T. Ivanov wrote:

>>> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>

>>> Allows controller to be specified via device tree.
>>> Pass PHY phandle specified in DT to core driver.

>>> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
>>> ---
>>>    drivers/usb/chipidea/ci_hdrc_msm.c |   23 ++++++++++++++++++++++-
>>>    1 file changed, 22 insertions(+), 1 deletion(-)

>>      You also need to describe the binding you're creating in
>> Documentation/devicetree/bindings/usb/<file>.txt.

> Did you check "[PATCH v2 1/3]"?

    Did you send it to 'linux-usb'? I just didn't get the patch.
(Typically, the bindings are described in the same patch the DT support is 
added to the driver bu YMMV, of course.)

> Regards,
> Ivan

WBR, Sergei
