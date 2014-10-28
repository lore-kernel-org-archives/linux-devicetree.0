From: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] dt:numa: adding numa node mapping for memory nodes.
Date: Tue, 28 Oct 2014 15:27:12 +0800
Message-ID: <544F4550.701@linaro.org>
References: <1410944189-3608-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <A4205FCA-D4DE-48A4-B19F-58400A3FBF5C@codeaurora.org> <20140917193452.GD7983@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140917193452.GD7983@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2014-9-18 3:34, Mark Rutland wrote:
> On Wed, Sep 17, 2014 at 04:37:30PM +0100, Kumar Gala wrote:
>>
>> On Sep 17, 2014, at 1:56 AM, Ganapatrao Kulkarni <ganapatrao.kulkarn=
i@caviumnetworks.com> wrote:
>>
>>> From: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>>
>>> This patch adds property "nid" to memory node to provide the memory=
 range to
>>> numa node id mapping.
>>>
>>> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>>
>>> =E2=80=94
>>
>> Adding the PPC guys as they=E2=80=99ve been doing NUMA on IBM Power =
Servers
>> for years with OF/DT.  So we should really try and follow what they=E2=
=80=99ve
>> done.
>=20
> Agreed.
>=20
>>> Documentation/devicetree/bindings/numa.txt | 58 +++++++++++++++++++=
+++++++++++
>>> 1 file changed, 58 insertions(+)
>>> create mode 100644 Documentation/devicetree/bindings/numa.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/numa.txt b/Documenta=
tion/devicetree/bindings/numa.txt
>>> new file mode 100644
>>> index 0000000..c4a94f2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/numa.txt
>>> @@ -0,0 +1,58 @@
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +numa id binding description
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +1 - Introduction
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +The device node  property "nid(numa node id)" can be added to memo=
ry
>=20
> Why the quotes?
>=20
>>> +device node to map the range of memory addresses as defined in pro=
perty "reg".
>>> +The property "nid" maps the memory range to the numa node id, whic=
h is used to
>>> +find the local and remory pages on numa aware systems.
>=20
> What is a "numa node id", exactly, and how is the OS intended to use =
it?

I think "Proximity Domain" would be more suitably, processors and memor=
y or IOs
in the same domain will have better performance than crossing other dom=
ains.

Thanks
Hanjun
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
