From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: microblaze device-tree description - pair intc/buses and timers
Date: Wed, 12 Jun 2013 10:16:33 +0100
Message-ID: <CACxGe6skAtfzcNFX=0upAWqr6td+7wYsPxvo1q6Q9khn4N=Y6Q@mail.gmail.com>
References: <51A35E6D.5040706@monstr.eu> <20130611130236.D2ACA3E0A90@localhost>
 <51B72F4B.9030700@monstr.eu> <20130611222225.9753A3E0D8D@localhost>
 <51B8157D.5000407@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51B8157D.5000407-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Edgar Iglesias <edgari-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter Crosthwaite <pcrost-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2013 at 7:30 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> On 06/12/2013 12:22 AM, Grant Likely wrote:
>> On Tue, 11 Jun 2013 16:08:11 +0200, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
>> It would mean every device driver needs to be polled. As long as the
>> polling frequency is high enough for the work load then it should be
>> okay. I don't see a problem with there being no interrupt controller,
>> unless there needs to be a dummy one just to keep the kernel happy.
>
> Interesting. I have tried to compile the fragment below by dtc
> and there is no warning. It also means that there is missing checking
> in DTC for interrupt-cells.
>
> What I am worried about is that request_irq in the driver will require
> irq chip functions which there are not.

A driver cannot call request_irq if it doesn't have an irq number to
call it with, and it won't have an IRQ number if there is no irq
specifier in the DT, so you should be fine in that regard.

g.
