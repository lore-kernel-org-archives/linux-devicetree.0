From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 09:45:10 -0600
Message-ID: <BANLkTim9_n85ahW781fGjf_iofhBjnD36w@mail.gmail.com>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
	<BANLkTin0krYi+MqngSQ5n-752vDa_a8ZtA@mail.gmail.com>
	<BANLkTin-qL3ppG1jRjBu3S16SWcNjD=3kA@mail.gmail.com>
	<201104191707.40456.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201104191707.40456.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2011 at 9:07 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 19 April 2011, Grant Likely wrote:
>> > or whatever, as this would bind all instances matching vendor,device.
>> >
>> > So, the question I have is, how to handle bind per-instance?
>>
>> By manipulating a property on the device instance of course! =A0:-)
>>
>> Something like: =A0echo "generic-uio" >>
>> /sys/devices/path/to/device/a-property-that-changes-the-driver-it-will-b=
ind-to.
>>
>
> But what code would create that in sysfs, and based on what properties
> of the device? Should we do that for every platform device, or perhaps
> for every one that has any resources?

Yes, I think it can be a generic facility for all platform_devices.
We already have some code to support user-space manipulated driver
binding/unbinding.  This is very much in the same vein.

g.
