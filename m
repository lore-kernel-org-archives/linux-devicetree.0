From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V8] kbuild: create a rule to run the pre-processor on
 *.dts files
Date: Tue, 12 Feb 2013 18:08:05 +0000
Message-ID: <20130212180805.556C93E1202@localhost>
References: <1360091188-24063-1-git-send-email-swarren@wwwdotorg.org>
 <20130208144527.0D8DD3E2C01@localhost> <51156D09.7060401@gmail.com>
 <20130208220448.EDA773E2C27@localhost> <51157F65.2050309@wwwdotorg.org>
 <5119425A.1090802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5119425A.1090802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Feb 2013 12:11:22 -0700, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 02/08/2013 08:45 AM, Grant Likely wrote:
> > On Tue,  5 Feb 2013 12:06:28 -0700, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> >> Create cmd_dtc_cpp to run the C pre-processor on *.dts file before
> >> passing them to dtc for final compilation. This allows the use of #define
> >> and #include within the .dts file.
> ...
> > I've applied this and was going to push it out, but I've just thought of
> > a problem that could be a show stopper. ...
> 
> Grant, I notice this showed up in next-20130211 as:
> 
> 22435f3 kbuild: create a rule to run the pre-processor on *.dts files
> 
> Was that intentional? I assumed you wanted me to rework this before
> you'd apply it, rather than sending an incremental patch.

Yes it was intentional. I sat on my hands w.r.t. this patch for long
enough that I didn't want to delay it any longer. However, I still want
a solution to the problem discussed above before it becomes a
maintenance disaster.

g.


-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
