From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: PCI bus node location
Date: Wed, 11 Nov 2009 11:06:00 -0600
Message-ID: <4AFAEEF8.3040303@freescale.com>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>	<A3A4CAD4-BE74-4CD4-BFFA-FE616DF38811@semihalf.com>	<20091111000540.GB3235@yookeroo.seuss>
	<8239D9E6-E390-4DED-81C1-77FACF05C1D4@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8239D9E6-E390-4DED-81C1-77FACF05C1D4-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rafal Jaworowski wrote:
> On 2009-11-11, at 01:05, David Gibson wrote:
>> Well, yes.  And worse, it means there's two places that need to be
>> adjusted rather than one, if the the IMMR is relocated (which it can
>> be).  But it's a trade-off of this versus the inconvenience of dealing
>> with separate "control" and "bridge" nodes for the PCI and following
>> phandles between them.
> 
> Would the technique with additional control node and a phandle 
> complicate bindings handling much? The clear benefit is the ability to 
> truly reflect hierarchy of devices available within IMMR/CCSR block.

It's not very complicated at all, just a few extra lines of code to follow the 
link.  I had initially done pq2 PCI that way, but it was NACKed because it was 
different:

http://lists.ozlabs.org/pipermail/linuxppc-dev/2007-August/041671.html

>> I don't really understand the question.  As Grant has said the
>> "correct" approach is to have one node representing the control
>> registers - located under the IMMR ("soc") node - and another
>> representing the PCI host bridge itself (which would be in its present
>> location).  There would need to be phandles linking the two.  It
>> doesn't really need any extension to the device tree semantics itself
>> - just a more complex binding for this device.
> 
> Maybe I misunderstood Grant, my impression was that there was possible 
> some 'fixing' of ranges properties (which would be alternative to the 
> control node approach).

But that would introduce even more dual maintenance.

-Scott
