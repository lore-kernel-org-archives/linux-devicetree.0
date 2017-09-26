From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 09/12] usb: typec: tcpm: only drives the connected cc line
 when attached
Date: Tue, 26 Sep 2017 06:20:15 -0700
Message-ID: <e79d8143-1187-f3c4-6030-ecf28e3d2fff@roeck-us.net>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
 <1506386727-16370-10-git-send-email-jun.li@nxp.com>
 <9c461105-fa96-3989-5a95-b9f82b154ea2@roeck-us.net>
 <DB4PR04MB07689A95430FA6F4AA219539897B0@DB4PR04MB0768.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB4PR04MB07689A95430FA6F4AA219539897B0-tLF+feb1Bz6HC8XOQgzeLs9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org" <o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, "A.s. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/26/2017 02:53 AM, Jun Li wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Guenter Roeck [mailto:groeck7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org] On Behalf Of Guenter Roeck
>> Sent: Tuesday, September 26, 2017 3:17 PM
>> To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
>> mark.rutland-5wv7dgnIgG8@public.gmane.org; heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
>> Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org; o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org; Peter Chen
>> <peter.chen-3arQi8VN3Tc@public.gmane.org>; A.s. Dong <aisheng.dong-3arQi8VN3Tc@public.gmane.org>; linux-
>> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH 09/12] usb: typec: tcpm: only drives the connected cc line
>> when attached
>>
>> On 09/25/2017 05:45 PM, Li Jun wrote:
>>> As we should only drive connected cc line to be the right state when
>>> attached, and keeps the other one to be open, so update the set_cc
>>> interface for that.
>>>
>>> Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
>>> ---
>>>    drivers/usb/typec/tcpm.c | 12 +++++++++++-
>>>    include/linux/usb/tcpm.h |  3 ++-
>>>    2 files changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c index
>>> 38a6223..c9966ee 100644
>>> --- a/drivers/usb/typec/tcpm.c
>>> +++ b/drivers/usb/typec/tcpm.c
>>> @@ -1857,9 +1857,15 @@ static bool tcpm_start_drp_toggling(struct
>>> tcpm_port *port,
>>>
>>>    static void tcpm_set_cc(struct tcpm_port *port, enum typec_cc_status cc)
>>>    {
>>> +	bool attached;
>>> +
>>>    	tcpm_log(port, "cc:=%d", cc);
>>>    	port->cc_req = cc;
>>> -	port->tcpc->set_cc(port->tcpc, cc);
>>> +	if (port->state == SRC_ATTACHED || port->state == SNK_ATTACHED)
>>> +		attached = true;
>>> +	else
>>> +		attached = false;
>>> +	port->tcpc->set_cc(port->tcpc, cc, attached, port->polarity);
>>
>> Polarity should be set with set_polarity(). Is it necessary to duplicate that ?
> 
> In tcpci case, set_polarity only sets Plug Orientation bit:
> " 0b: When Vconn is enabled, apply it to the CC2 pin. Monitor the CC1 pin for
> BMC communications if PD messaging is enabled.
> 1b: When Vconn is enabled, apply it to the CC1 pin. Monitor the CC2 pin for
> BMC communications if PD messaging is enabled."
> 
Yes, but the driver should know about the flag already.

I have two more concerns:

Setting CC is logically independent from the state machine "active" state.
I don't recall that the USB PD state machine talks about CC pin changes upon
entering and exiting READY states. Why is it necessary to pass the state
to the driver ?

Also, your patch changes the API, but you don't change the driver, meaning there
should be compile failures after this patch. You need to change the calling code
in the same patch to keep the build clean.

Guenter

> There is no duplication for tcpci, or you think I should do this in set_polarity
> of tcpci driver internally? looks better from my point view as I may don't
> need change tcpm set_cc interface.
> 
> thanks
> Li Jun
>>
>>>    }
>>>
>>>    static int tcpm_init_vbus(struct tcpm_port *port) @@ -1913,6 +1919,8
>>> @@ static int tcpm_src_attach(struct tcpm_port *port)
>>>    	if (ret < 0)
>>>    		return ret;
>>>
>>> +	tcpm_set_cc(port, tcpm_rp_cc(port));
>>> +
>>>    	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
>>>    	if (ret < 0)
>>>    		return ret;
>>> @@ -2028,6 +2036,8 @@ static int tcpm_snk_attach(struct tcpm_port *port)
>>>    	if (ret < 0)
>>>    		return ret;
>>>
>>> +	tcpm_set_cc(port, TYPEC_CC_RD);
>>> +
>>>    	ret = tcpm_set_roles(port, true, TYPEC_SINK, TYPEC_DEVICE);
>>>    	if (ret < 0)
>>>    		return ret;
>>> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h index
>>> a67cf77..a007e2a1 100644
>>> --- a/include/linux/usb/tcpm.h
>>> +++ b/include/linux/usb/tcpm.h
>>> @@ -159,7 +159,8 @@ struct tcpc_dev {
>>>    	int (*init)(struct tcpc_dev *dev);
>>>    	int (*get_vbus)(struct tcpc_dev *dev);
>>>    	int (*get_current_limit)(struct tcpc_dev *dev);
>>> -	int (*set_cc)(struct tcpc_dev *dev, enum typec_cc_status cc);
>>> +	int (*set_cc)(struct tcpc_dev *dev, enum typec_cc_status cc,
>>> +			bool attached, enum typec_cc_polarity polarity);
>>>    	int (*get_cc)(struct tcpc_dev *dev, enum typec_cc_status *cc1,
>>>    		      enum typec_cc_status *cc2);
>>>    	int (*set_polarity)(struct tcpc_dev *dev,
>>>
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
