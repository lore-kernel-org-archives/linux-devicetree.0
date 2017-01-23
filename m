From: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3: add quirk to handle DWC_USB3_NUM ==
 DWC_USB3_NUM_IN_EPS
Date: Mon, 23 Jan 2017 15:49:53 +0000
Message-ID: <81853e89-c22a-cf7f-bbc7-abe4f9a59456@nexus-software.ie>
References: <1484855882-4936-1-git-send-email-pure.logic@nexus-software.ie>
 <20170123153815.qxridbif7dg4k23z@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170123153815.qxridbif7dg4k23z@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/01/17 15:38, Rob Herring wrote:

>>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>> + - snps,num_in_eps_quirk: when set core will over-ride the num_in_eps value.
>> + - snps,num_in_eps_override: the value that will be used for num_in_eps when
>> +			num_in_eps_quirk is true
> 
> Why do you need 2 properties? Presence of the prop eanbles the override 
> and the value of the prop provides the value.

We don't, sorry Rob I didn't CC you on the follow up patch, we've
decided to do everything in-code minus any DT bindings.

---
bod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
