From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 25/36] devicetree: document ingenic,jz4780-uart binding
Date: Sun, 25 Jan 2015 19:17:20 +0100
Message-ID: <54C53330.80701@metafoo.de>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com> <1421620869-25063-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421620869-25063-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/18/2015 11:41 PM, Paul Burton wrote:
> +++ b/Documentation/devicetree/bindings/serial/ingenic,jz4780-uart.txt
> @@ -0,0 +1,22 @@
> +* Ingenic jz4780 UART
> +
> +Required properties:
> +- compatible : "ingenic,jz4780-uart"

Same as for the intc binding. Just add the compatible string to the jz4740 uart 
binding specification.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
