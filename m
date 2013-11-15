From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] dt: update PSCI binding documentation for v0.2
Date: Fri, 15 Nov 2013 09:39:10 -0600
Message-ID: <5286401E.5090400@gmail.com>
References: <1379625868-5395-1-git-send-email-robherring2@gmail.com> <alpine.DEB.2.02.1311151447590.4714@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1311151447590.4714-7Z66fg9igcxYtxbxJUhB2Dgeux46jI+i@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Charles Garcia-Tobin <Charles.Garcia-Tobin-5wv7dgnIgG8@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/15/2013 08:48 AM, Stefano Stabellini wrote:
> On Thu, 19 Sep 2013, Rob Herring wrote:
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> The PSCI spec from ARM has been updated to 0.2 version. Update the
>> binding document to reflect the spec changes. For the binding, the
>> major changes are the addition of psci_version, affinity_info,
>> migrate_info_type, migrate_info_up_cpu, system_reset and system_off
>> functions. The recommended function ID numbering has also changed.
>>
>> This update also defines 32 and 64 bit calling conventions. The calling
>> convention is defined on a per function ID basis.
>>
>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
>> Cc: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
>> Cc: Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>
>> Cc: Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>,
>> Cc: Charles Garcia-Tobin <Charles.Garcia-Tobin-5wv7dgnIgG8@public.gmane.org>
>> Cc: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> Rob,
> I noticed that this patch hasn't gone upstream yet. Is the interface
> still under discussion?
> I am thinking of implementing the Xen side of it.

Since we can't seem to agree on how to extend the binding, I plan to go
back to something more simple which is simply adding 2 optional
properties to the existing "arm,psci" binding. This would be enough to
meet the needs of KVM, Xen, and highbank. A future binding can deal with
the whole 32 and 64-bit calling convention issue.

Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
