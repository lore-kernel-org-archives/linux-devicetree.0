From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dtc: Add support for variable sized elements
Date: Tue, 11 Oct 2011 08:12:55 -0700
Message-ID: <CAF6FioXceJM=aKdbP=czrKWUG_-rVWgVr=1F5MeqDggF7=nZFA@mail.gmail.com>
References: <1317147098-11550-1-git-send-email-robotboy@chromium.org>
 <1317147098-11550-4-git-send-email-robotboy@chromium.org>
 <20111011144413.GJ4849@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111011144413.GJ4849-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 11, 2011 at 7:44 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Sep 27, 2011 at 11:11:38AM -0700, Anton Staaf wrote:
>> Elements of size 8, 16, 32, and 64 bits are supported. =A0The new
>> /bits/ syntax was selected so as to not pollute the reserved
>> keyword space with uint8/uint16/... type names.
>>
>> With this patch the following property assignment:
>>
>> =A0 =A0 property =3D /bits/ 16 <0x1234 0x5678 0x0 0xffff>;
>>
>> is equivalent to:
>>
>> =A0 =A0 property =3D <0x12345678 0x0000ffff>;
>>
>> It is now also possible to directly specify a 64 bit literal in a
>> cell list, also known as an array using:
>>
>> =A0 =A0 property =3D /bits/ 64 <0xdeadbeef00000000>;
>>
>> It is an error to attempt to store a literal into an element that is
>> too small to hold the literal, and the compiler will generate an
>> error when it detects this. =A0For instance:
>>
>> =A0 =A0 property =3D /bits/ 8 <256>;
>>
>> Will fail to compile. =A0It is also an error to attempt to place a
>> reference in a non 32-bit element.
>>
>> The documentation has been changed to reflect that the cell list
>> is now an array of elements that can be of sizes other than the
>> default 32-bit cell size.
>>
>> The sized_cells test tests the creation and access of 8, 16, 32,
>> and 64-bit sized elements. =A0It also tests that the creation of two
>> properties, one with 16 bit elements and one with 32 bit elements
>> result in the same property contents.
>>
>> Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> What the hell, I think I've convinced myself that /bits/ is good
> enough.

Thanks David, I haven't thought of anything more appropriate either.
I'm looking forward to getting this landed.  :)

-Anton

> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
