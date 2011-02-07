From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device Tree on ARM status report
Date: Mon, 7 Feb 2011 14:28:47 -0700
Message-ID: <AANLkTi=dK2qYTH7vThJb8-3wED5F_5Hcmr7nNidxs25c@mail.gmail.com>
References: <AANLkTikLvO0Y44nCxEfCsNxU-Na+PzcLXZUjOsMUM1_A@mail.gmail.com>
	<20110207084613.GC2723@matterhorn.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110207084613.GC2723-HeifvKp/9wrwg6x6O6sdfg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Linux Kernel Mailing List <linux-kerne>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 7, 2011 at 1:46 AM, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 11 Feb 05, Grant Likely wrote:
>> 2 - Task status
>> ---------------
>> Core infrastructure:
>> [glikely] basic infrastructure to enable dt: DONE
>> [r-herring] Allow dtb to be located anywhere in RAM: DONE
>> [bones] Debug dtb corruption during init: INPROGRESS
>> [glikely] OF clock bindings: INPROGRESS
>
> Does this include the common clock framework that Jeremy had been working on?
> I see no mention of that explicitly, hence the question.

No, since the common clk patches are taking some time to get right,
the device tree clock bindings have been decoupled from the common clk
patches so that dt support doesn't get held up.  When common clk gets
merged, the dt support will be modified to use it.

g.
