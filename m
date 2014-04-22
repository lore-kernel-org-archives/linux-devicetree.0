From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv3] of: fix of_update_property again
Date: Tue, 22 Apr 2014 09:10:35 -0500
Message-ID: <CAL_JsqK6O8AeSMZTv=-nOApr6rhJG=-PTnL4EiomOEGH+jjCRw@mail.gmail.com>
References: <1397720909-24774-1-git-send-email-Li.Xiubo@freescale.com>
	<CAL_JsqKFRLECtSL3CKE_heruO-RJh96G-C_NsEZFVRkjAOdL-Q@mail.gmail.com>
	<20140422140605.EEA6EC40793@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140422140605.EEA6EC40793-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 22, 2014 at 9:06 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, 17 Apr 2014 09:32:16 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Thu, Apr 17, 2014 at 2:48 AM, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> > The of_update_property() is intented to update a property in a node
>> > and if the property does not exist, will add it.
>> >
>> > The second search of the property is possibly won't be found, that
>> > maybe removed by other thread just before the second search begain.
>> >
>> > Using the __of_find_property() and __of_add_property() instead and
>> > move them into lock operations.
>>
>> I have a fix in my tree from Guenter which handles the race of the
>> property being removed. However, your change will be needed when we
>> have overlays and the node itself can be removed. So this is 3.16
>> material and will need to be rebased on Guenter's fix.
>
> I didn't think Guenter's patch actually fixed a race. It only fixed a
> double checking of the oldprop pointer. Do I have it wrong?

Yes, the commit message should have been clearer. The problem was that
found was checked after updating the sysfs files.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
