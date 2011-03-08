From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/3] OLPC: Use device tree for platform identification
Date: Tue, 8 Mar 2011 21:13:00 +0000
Message-ID: <AANLkTi=Jcq5SDbWgN+1TQNeP3CvJVRY7CO3c__DDEPz3@mail.gmail.com>
References: <20110304171214.2B5C69D401D@zog.reactivated.net>
	<20110304100137.473b8d04@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110304100137.473b8d04@debxo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4 March 2011 18:01, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org> wrote:
>> +static int __init declare_of_platform_devices(void)
>> +{
>> + =A0 =A0 return of_platform_bus_probe(NULL, of_ids, NULL);
>> +}
>> +device_initcall(declare_of_platform_devices);
>
> How about 'olpc_create_platform_devices' or some such name? =A0That's
> what's really happening here, right?

The reason I called it declare_of_platform_devices is because thats
what all the other platforms do (do a git grep). do you still think it
should be renamed?

Daniel
