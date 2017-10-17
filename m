From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: max3421: Add bindings documentation
Date: Tue, 17 Oct 2017 22:06:35 +0300
Message-ID: <fbe8280d-34aa-a58a-e4f4-1a1a11792b06@cogentembedded.com>
References: <cover.1508108927.git.jules.maselbas@grenoble-inp.org>
 <832170edafa26b7b2bed76afe170f1c9c4f7b9ae.1508108927.git.jules.maselbas@grenoble-inp.org>
 <a064c008-2268-26ef-edee-47bda38b117b@cogentembedded.com>
 <6a3f35f1-dae9-063d-963e-812a7341f612@cogentembedded.com>
 <1452233455.381184.1508188958452.JavaMail.zimbra@grenoble-inp.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452233455.381184.1508188958452.JavaMail.zimbra-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, julia lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/17/2017 12:22 AM, Jules Maselbas wrote:

> Thanks Sergei,
> 
> Is it better if the documentation say:
> "
> Optional property:
>   - interrupt-parent: the phandle of the associated interrupt controller.
> "

    That should be enough.

> or should I also add that "it may be inherited from the parent nodes."?
> 
> Jules Maselbas.

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
