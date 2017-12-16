From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH for v4.15] dt-bindings/media/cec-gpio.txt: mention the
 CEC/HPD max voltages
Date: Sat, 16 Dec 2017 12:38:20 -0600
Message-ID: <20171216183820.wvlktltzfjidlbeq@rob-hp-laptop>
References: <064113a5-f8be-5b10-091f-a89b87baa5a3@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <064113a5-f8be-5b10-091f-a89b87baa5a3-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 16, 2017 at 11:44:13AM +0100, Hans Verkuil wrote:
> Mention the maximum voltages of the CEC and HPD lines. Since in the example
> these lines are connected to a Raspberry Pi and the Rpi GPIO lines are 3.3V
> it is a good idea to warn against directly connecting the HPD to the Raspberry
> Pi's GPIO line.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
