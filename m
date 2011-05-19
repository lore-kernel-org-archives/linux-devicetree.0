From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Pinmux with device tree
Date: Thu, 19 May 2011 19:30:52 +0800
Message-ID: <BANLkTim94SKgWvUF6_PWb9O5YsuNk120Bw@mail.gmail.com>
References: <BANLkTin5wBtR4zkgsQ6dw1jQP8yQGCDS2Q@mail.gmail.com>
	<4DD41F02.4050108@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4DD41F02.4050108-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 19, 2011 at 3:33 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
> On 5/18/2011 6:34 AM, Simon Glass wrote:
>>
>> Hi,
>>
>> I see a new pinmux system in the LKML. Has anyone looked at how to
>> represent pinmux settings in the device tree?
>>
>> On a related topic, the examples that are used for GPIOs assume a
>> flags word which describes things like pull-ups, direction, etc. This
>> seems pretty cumbersome and gets worse with pinmuxes. People editing
>> the device trees want to see symbolic information rather than a coded
>> number, a bit like a #define. I can see this can be done with strings
>> but this is inefficient in time and space, and is error-prone. =A0Is
>> there support for this in device trees that I have missed?
>
> Open Firmware deals with this by defining both a numerical representation
> and a text representation. =A0The numerical representation appears in mem=
ory
> in device tree property values, and the corresponding text representation=
 is
> for display and human input.
>
Could it be supported by flattened device tree? It seems that open firmware
isn't popular in ARM system.

> It primarily applies to unit addresses, i.e. the "reg" property value, but
> the idea generalizes. =A0The device tree compiler could accept the symbol=
ic
> names, converting them into well-defined bitfield values which would be
> stored in integer cells within property values.
>
>
>
