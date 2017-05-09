From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
Date: Tue, 9 May 2017 09:02:54 +0800
Message-ID: <8570743c-d3cb-9b05-c21a-868bceb7e805@ozlabs.org>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
 <20170508144236.r5ezra467hyzebtv@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170508144236.r5ezra467hyzebtv@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/fsi.txt
>> @@ -0,0 +1,144 @@
>> +FSI bus & engine generic device tree bindings
>> +=============================================
>> +
>> +The FSI bus is probe-able, so Linux is able to enumerate FSI slaves, and
> 
> s/Linux/the OS/

Ah, of course. Will change.

> Otherwise, looks good to me.

OK, I'll roll another revision with the changes mentioned. I also have
the patches that add the DT parsing code to implement this binding.
Those only affect the FSI core, but I'd be keen to include
devicetree@vger in those follow-ups. Any objections?

Cheers,


Jeremy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
