From: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PCI EDAC on MPC85xx
Date: Tue, 31 May 2011 23:25:05 +0400
Message-ID: <BANLkTikNxFktd6c4rM9E0Xc+f6mQ=FGu7A@mail.gmail.com>
References: <20110531131737.GA29164@doriath.ww600.siemens.net>
	<7373D079-743D-4D49-BDC6-2BEAF14C43DF@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <7373D079-743D-4D49-BDC6-2BEAF14C43DF-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 5/31/11, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>
> On May 31, 2011, at 8:17 AM, Dmitry Eremin-Solenikov wrote:
>
>> Hello,
>>
>> Long time ago (around July of 2010), I've reported a problem of binding
>> pci error reporting driver to the hardware (See
>> http://thread.gmane.org/gmane.linux.kernel.edac/181). Grant Likely has
>> come with a patch to create platform devices (of_platform at that time),
>> for device_nodes which have "compatible" properties
>> (http://article.gmane.org/gmane.linux.ports.ppc.embedded/36981).
>>
>> The patch was not applied at that time and the problem still arises at
>> 3.0-rc1. Should the patch in question be applied, or is there any new
>> solution?
>> Current version of that patch which I have in my tree is attached
>> to this mail (no original signoff by Grant).
>>
>> --
>> With best wishes
>> Dmitry
>>
>> <0001-of-device-Register-children-with-a-compatible-value-.patch>
>
> I think the desired solution here was to create a new node in the fsl_pci
> code that the edac code would bind against.

Sorry, got mistaken then by Grant=B4s patch. Will provide an update on this=
 topic
soon.


-- =

With best wishes
Dmitry
