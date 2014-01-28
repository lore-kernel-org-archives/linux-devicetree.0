From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: Firmware for Bluetooth (and wifi)
Date: Tue, 28 Jan 2014 11:11:02 +0100
Message-ID: <52E78236.50702@broadcom.com>
References: <52A040CE.5040706@schinagl.nl> <52A09B5B.70800@schinagl.nl> <CAGRGNgWBgWqoPUdHSm2OXGb8r-ca5NX2z4_v0eG6oOMgJRd3HQ@mail.gmail.com> <52B17973.1000608@broadcom.com> <52B19F38.7060503@redhat.com> <52B1CA51.4010202@broadcom.com> <CAGb2v67cnP0yth0xxBKcaW_T2fF+4nP4r6h9NLqy5FV2x=hO=Q@mail.gmail.com> <CAGb2v67mmYnyPeOd4Wwp1zHs7EC_Gr+gEdaaMWeKP5z_Z_SVGA@mail.gmail.com> <CAGb2v66646-1Sye=Eb04_SoeCGBU064OePcxDi7th1fqU8XfBg@mail.gmail.com> <52BD68BA.3080304@broadcom.com> <CAGb2v67Q=q4vyOftb+BLhAYR-6d04dDP3+kY3b88U8_vCvAmgQ@mail.gmail.com> <52CD12D4.5030008@broadcom.com> <CAGb2v64+5Rgs6JxD0iH3bcwXPOm-xyS_LSmWLfx0qiMQwreOeQ@mail.gmail.com> <52E19A27.7000402@redhat.com> <52E19E1C.1010402@redhat.com> <CAGb2v66KhGoGmoFkTw9PQYBtX9YQbmxk4oy_tM4LM_UhZMkcZg@mail.gmail.com> <52E5392B.80605@redhat.com>
  <CAGb2v6594vsKCd9E8apojQXE8h6WJj4-doJ8wa85Nt3EFZhXHA@mail.gmail.com> <52E580A8.4060600@broadcom.com> <52E5A631.4030204@gmail.com> <52E62510.5090103@broadcom.com> <52E630F4.8090805@gmail.com
 >
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCKLZOXH5AIBBO4ET2LQKGQE533QYVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52E630F4.8090805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/27/2014 11:12 AM, Tomasz Figa wrote:
>> The brcmfmac driver that consumes these DT nodes will have a closer look
>> at the device obtaining the chipid during the probe and determine if it
>> can support it. So the compatible string indicates that the device needs
>> a so-called fullmac wireless driver opposed to a mac80211 aka. softmac
>> wireless driver.
> 
> The compatible string should guarantee that the chip ID register holds a
> valid value, so just "wifi-fullmac" or "brcmfmac" sounds too generic to

I am not sure I understand this requirement. Is the DT node claimed
somehow after of_find_matching_node() and unavailable to other drivers.

> me. The string must specify the family of chips with this chip ID scheme
> in a reasonably precise way. "brcm,bcm43xx-fmac" maybe? I still see a
> risk of, say, BCM43999 showing up, which would be a completely different
> chip. while having the model matching the pattern.

If a completely different chip, ie. BCM43999, shows up in a board the
device tree should not use "brcm,bcm43xx-fmac". That would be an error
in the dts file, right? All the devices listed in your bindings patch
are treated the same, ie. *compatible* on DT level and hence can have
the same compatible property.

In my opinion that is what the compatible property is about. It
identifies how a specific category of devices is accessed/configured. As
an example please see [1]. It shows one compatible string for a binding
that is used for different MPIC controllers.

Just to be clear, I like your suggestion to use "brcm,bcm43xx-fmac", but
felt you did not so added my explanation/point of view.

Regards,
Arend

[1] Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
