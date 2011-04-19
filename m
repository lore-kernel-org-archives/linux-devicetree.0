From: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Subject: Re: Runtime driver selection for a certain device
Date: Tue, 19 Apr 2011 18:14:12 +0200
Message-ID: <4DADB4D4.1010208@grandegger.com>
References: <4DAC8F8A.6060301@grandegger.com>
	<BANLkTim6Zbh05sO_LpH5RAJUoBFr_=jHLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTim6Zbh05sO_LpH5RAJUoBFr_=jHLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/18/2011 09:22 PM, Grant Likely wrote:
> On Mon, Apr 18, 2011 at 1:22 PM, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org> wrote:
>> Hallo,
>>
>> I'm looking for a solution for the following problem:
>>
>> A device may be served by more than one driver depending on the
>> application. Therefore the driver to use should be selectable at
>> run-time. Lets imaging 4 serial line devices normally handled by the
>> Linux serial driver. One of those needs eventually be handled by another
>> driver. How could that be realized, especially together with the device
>> tree, which is pretty static. Is there a generic way? The bind/unbind
>> functions look promising but it's not possible to register more than one
>> driver for a device.
> 
> Depends on the bus type.  I would look at registering the device in
> such a way that no driver will bind against it, and then change the
> configuration from userspace so the one of the drivers will get bound.

OK, I got a bit further. I think the following will work:

# echo f0002c00.serial > \
	/sys/devices/f0000000.soc5200/f0002c00.serial/driver/unbind

will unbind the driver for PSC6 and when I then load another serial
driver module, it will grap the unbound devices, e.g. PSC6 in this
example. But how can I avoid that the driver probes all relevant devices
when it's registered, or even better, how can I avoid automatic driver
binding for certain devices. I think that's not forseen, at least not
for the platform bus... but maybe I have missed something.

Thanks,

Wolfgang.
