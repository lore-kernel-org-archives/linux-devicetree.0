From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fpga: Convert to using %pOF instead of full_name
Date: Thu, 10 Aug 2017 09:16:25 -0500
Message-ID: <CANk1AXSBmeJTU9GO+g+GVSWbxD-dSDB5UWpevc4uJ2jueH-jYg@mail.gmail.com>
References: <20170718214339.7774-22-robh@kernel.org> <20170719044221.GA1581@tyrael.ni.corp.natinst.com>
 <CANk1AXSZxj3bb5oXZAyonJ=QgDV3FKuPgSNFDo3m9hzfEtjbbg@mail.gmail.com> <CAL_JsqJoqK9UdDfQGc0ng1C+cYv4BSZfLaxDCJWJRS=pDCQzng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJoqK9UdDfQGc0ng1C+cYv4BSZfLaxDCJWJRS=pDCQzng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I sent it on 8/2/2017.  I probably missed a window.

Alan

On Wed, Aug 9, 2017 at 4:54 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Jul 19, 2017 at 9:32 AM, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Tue, Jul 18, 2017 at 11:42 PM, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Tue, Jul 18, 2017 at 04:43:02PM -0500, Rob Herring wrote:
>>>> Now that we have a custom printf format specifier, convert users of
>>>> full_name to use %pOF instead. This is preparation to remove storing
>>>> of the full path string for each node.
>>>>
>>>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>>>> Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Acked-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Acked-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> This hasn't been applied in -next. Are you going to send to Greg?
>
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
