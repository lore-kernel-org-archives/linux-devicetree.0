From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree bindings for linux ramoops use
Date: Fri, 6 Jan 2012 15:30:45 -0700
Message-ID: <CACxGe6uqMCdf7-OFU-5XVfwC9o9ti7fgdt44rsoim-TDKyAPrA@mail.gmail.com>
References: <CAOesGMiKBQM61DkLFoTcvMFWV2UCgomLQYDX65_Tkmtoy_hGCg@mail.gmail.com>
 <20120106220908.GJ7457@ponder.secretlab.ca> <4F07749B.6070703@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F07749B.6070703-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
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
Cc: Marco Stornelli <marco.stornelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 6, 2012 at 3:24 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
> On 1/6/2012 12:09 PM, Grant Likely wrote:
>>
>> On Thu, Jan 05, 2012 at 08:39:50PM -0800, Olof Johansson wrote:
>>>
>>> Hi,
>>>
>>> I'm considering how to best describe the data that ramoops needs in
>>> the device tree.
>>>
>>> The idea is really about describing a memory area that is (likely to
>>> be) nonvolatile across reboots. Said area is not to be included in the
>>> regular memory map of the system (i.e. not covered by /memory).
>>>
>>> I have a few options on where to do it. It's not really a hardware
>>> device per se, so it's a gray area for the device tree alltogether.
>>>
>>> How about something like?
>>>
>>> compatible =3D "linux,ramoops"
>>> linux,ramoops-start =3D<start address of preserved ram>
>>> linux,ramoops-size =3D ...
>>
>>
>> I'm not a fan of using separate start& =A0size properties. =A0I'd rather
>>
>> see a 'reg' type property like "linux,ramoops-mem =3D<start size>;",
>> but doing it in separate properties does may early boot code easier to
>> write. =A0I assume that is why the initrd start and size values are
>> passed separately.
>
>
> Separate properties admit the possibility of errors where one is present =
but
> not the other. =A0I prefer atomicity. =A0It's either there, with all the
> information, or it isn't.

.... I was /going/ to argue that having a single property requires
parsing #{address,size}-cells whereas passing separately does not...
but thinking about it more that isn't actually true (although the
cells size could be inferred when using separate properties).  So,
yes, I agree with Mitch.  A single property is better.

g.
